import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logkit/logkit.dart';

void main() {
  final logger = UISLogger();
  logger.log("Flutter logger initialized!");

  runApp(MyApp());
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
        child: ElevatedButton(
          onPressed: () {
            _logRandomMessage();
          },
          child: const Text("Generate Random Log"),
        ),
      ),
    );
  }

  void _logRandomMessage() {
    final logger = UISLogger();
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
    logger.log(messages[index], level: levels[index]);
  }
}
