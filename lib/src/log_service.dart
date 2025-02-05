import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:logger/logger.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class UISLogger {
  static final UISLogger _instance = UISLogger._internal();
  late Logger _logger;
  late Box _logBox;

  /// Use file logging only if not running on WebAssembly
  final bool _isFileLoggingEnabled = !kIsWeb;

  factory UISLogger() {
    return _instance;
  }

  UISLogger._internal() {
    _logger = Logger(printer: PrettyPrinter());
    initializeHive();
  }

  Future<void> initializeHive() async {
    if (kIsWeb) {
      return; // Hive doesn't require initialization in web
    }

    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    _logBox = await Hive.openBox('logs');

    // Check if logs from the previous day exist and delete them
    _deleteOldLogs();
  }

  void log(String message, {Level level = Level.info}) {
    final String logEntry =
        "[${DateTime.now().toIso8601String()}] [${level.name}] $message";

    // Print log in console (always works)
    _logger.log(level, message);

    // Only store logs in Hive if not running in WASM/Web
    if (_isFileLoggingEnabled) {
      _logBox.add(logEntry);
    }
  }

  void _deleteOldLogs() {
    if (_logBox.isNotEmpty) {
      DateTime lastLogTime =
          DateTime.parse(_logBox.getAt(0).split(']')[0].replaceAll('[', ''));
      DateTime today = DateTime.now();

      if (lastLogTime.day != today.day) {
        _logBox.clear(); // Delete all logs if they belong to the previous day
      }
    }
  }

  Future<String> exportLogsToFile() async {
    if (kIsWeb) {
      return "Export to file is not supported in WebAssembly (WASM).";
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String logFileName =
        "${DateTime.now().toIso8601String().split('T').first}.log";
    File logFile = File('${directory.path}/$logFileName');

    StringBuffer logBuffer = StringBuffer();
    for (var i = 0; i < _logBox.length; i++) {
      logBuffer.writeln(_logBox.getAt(i));
    }

    await logFile.writeAsString(logBuffer.toString());
    return logFile.path;
  }

  List<String> getAllLogs() {
    return _logBox.values.cast<String>().toList();
  }
}
