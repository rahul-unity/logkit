import 'dart:io';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart'
    if (dart.library.io) 'path_provider_io.dart';

class UISLogger {
  static final UISLogger _instance = UISLogger._internal();
  late Logger _logger;
  late String _logFilePath;

  factory UISLogger() {
    return _instance;
  }

  UISLogger._internal() {
    _logger = Logger(
      printer: PrettyPrinter(),
    );
    _initializeLogFile();
  }

  Future<void> _initializeLogFile() async {
    if (kIsWeb) {
      _logFilePath = 'web_logging_disabled.log';
      return;
    }

    if (Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isMacOS ||
        Platform.isLinux ||
        Platform.isWindows) {
      final directory = await getApplicationDocumentsDirectory();
      final logDir = Directory('${directory.path}/logs');
      if (!logDir.existsSync()) {
        logDir.createSync(recursive: true);
      }

      final String logFileName =
          "${DateTime.now().toIso8601String().split('T').first}.log";
      _logFilePath = '${logDir.path}/$logFileName';
    } else {
      _logFilePath = 'unsupported_platform.log';
    }
  }

  void log(String message, {Level level = Level.info}) {
    _logger.log(level, message);
    _writeToFile(message, level);
  }

  void _writeToFile(String message, Level level) async {
    final String logEntry =
        "[${DateTime.now().toIso8601String()}] [${level.name}] $message\n";

    final file = File(_logFilePath);
    await file.writeAsString(logEntry, mode: FileMode.append);
  }
}
