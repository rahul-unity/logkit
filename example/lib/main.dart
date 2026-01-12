import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logkit/logkit.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final logkit = LogKit();
  await logkit.initialize(); // Initialize Hive before logging

  logkit.log("App started");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoggerScreen(),
    );
  }
}

class LoggerScreen extends StatelessWidget {
  const LoggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Logger Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _logRandomMessage();
              },
              child: const Text("Generate Random Log"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _exportLogs(context);
              },
              child: const Text("Export Logs"),
            ),
          ],
        ),
      ),
    );
  }

  void _logRandomMessage() {
    final logkit = LogKit();
    final random = Random();

    // Define log levels
    final levels = [
      Level.debug,
      Level.info,
      Level.warning,
      Level.error,
      Level.fatal
    ];
    final messages = [
      "Debugging...",
      "Info: User logged in",
      "Warning: Low disk space",
      "Error: Unable to fetch data",
      "Fatal: System crash imminent"
    ];

    int index = random.nextInt(levels.length);
    logkit.log(messages[index], level: levels[index]);
  }

  Future<void> _exportLogs(BuildContext context) async {
    final logkit = LogKit();

    if (kIsWeb) {
      logkit.exportLogsToWeb();

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Logs exported as download.")),
      );
    } else {
      final path = await logkit.exportLogsToFile();

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logs exported to: $path")),
      );
    }
  }
}
