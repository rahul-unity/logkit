import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:logger/logger.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'log_export_stub.dart' if (dart.library.html) 'log_export_web.dart';

/// UISLogger provides logging functionality with persistent storage.
class UISLogger {
  static final UISLogger _instance = UISLogger._internal();
  late Logger _logger;
  Box? _logBox;

  factory UISLogger() => _instance;

  UISLogger._internal() {
    _logger = Logger(printer: PrettyPrinter());
  }

  /// Call this before logging
  Future<void> initialize() async {
    if (kIsWeb) {
      _logBox = await Hive.openBox('logs');
      _deleteOldLogs();
      return;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _logBox = await Hive.openBox('logs');
    _deleteOldLogs();
  }

  void log(String message, {Level level = Level.info}) {
    final logEntry =
        "[${DateTime.now().toIso8601String()}] [${level.name}] $message";
    _logger.log(level, message);
    _logBox?.add(logEntry);
  }

  void _deleteOldLogs() {
    if (_logBox == null || _logBox!.isEmpty) return;
    final firstLog = _logBox!.getAt(0);
    if (firstLog is String) {
      final dateStr = firstLog.split(']')[0].replaceAll('[', '');
      final logDate = DateTime.tryParse(dateStr);
      final today = DateTime.now();
      if (logDate != null && logDate.day != today.day) {
        _logBox!.clear();
      }
    }
  }

  Future<String> exportLogsToFile() async {
    if (kIsWeb) return "Export to file is not supported in WebAssembly (WASM).";

    Directory directory = await getApplicationDocumentsDirectory();
    String logFileName =
        "${DateTime.now().toIso8601String().split('T').first}.log";
    File logFile = File('${directory.path}/$logFileName');
    StringBuffer logBuffer = StringBuffer();

    for (var i = 0; i < (_logBox?.length ?? 0); i++) {
      logBuffer.writeln(_logBox!.getAt(i));
    }

    await logFile.writeAsString(logBuffer.toString());
    return logFile.path;
  }

  /// Call this on web to trigger browser download
  void exportLogsToWeb() {
    if (!kIsWeb || _logBox == null) return;
    final logs = _logBox!.values.cast<String>().toList();
    exportLogsToWebDownload(logs);
  }

  List<String> getAllLogs() {
    return _logBox?.values.cast<String>().toList() ?? [];
  }
}
