# LogKit 📜🚀

**LogKit** is a simple and efficient **Flutter logging package** that extends the popular [`logger`](https://pub.dev/packages/logger) package.  
It supports **console logging** and **file logging**, automatically saving logs in daily log files.

## 🌟 Features

✅ **Console Logging** – Uses `logger` package for structured logging  
✅ **File Logging** – Automatically writes logs to daily `.log` files  
✅ **Customizable Logging Levels** – Supports `debug`, `info`, `warning`, `error`, and `fatal` logs  
✅ **Works on Flutter & Dart** – Supports both mobile and desktop platforms  

---

## 🛠️ Getting Started

### **1️⃣ Install the package**
Add `logkit` to your `pubspec.yaml` dependencies:
```yaml
dependencies:
  logkit: ^0.0.1  # Use the latest version
```

Run:
```sh
flutter pub get
```

---

## 📌 Usage

### **1️⃣ Import LogKit**
```dart
import 'package:logkit/logkit.dart';
```

### **2️⃣ Initialize Logger**
```dart
final logger = UISLogger();
```

### **3️⃣ Log Messages**
```dart
logger.log("This is an info message");  // Default: Level.info

logger.log("Debugging details...", level: Level.debug);
logger.log("Something is wrong!", level: Level.warning);
logger.log("Critical Error!", level: Level.error);
```

### **4️⃣ Logs are also written to a daily log file**
Each day's logs are stored in `logs/YYYY-MM-DD.log` inside your device's document directory.

---

## 🎯 Example App
Here’s a simple Flutter app that logs messages when a button is clicked.

```dart
import 'package:flutter/material.dart';
import 'package:logkit/logkit.dart';

void main() {
  final logger = UISLogger();
  logger.log("App started!");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("LogKit Example")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final logger = UISLogger();
              logger.log("Button clicked!", level: Level.info);
            },
            child: const Text("Log Message"),
          ),
        ),
      ),
    );
  }
}
```

---

## 📂 Log File Location
On different platforms, log files are stored in:

| Platform  | Location |
|-----------|----------|
| Android / iOS | App documents directory (`getApplicationDocumentsDirectory()`) |
| macOS / Windows / Linux | User documents directory |
| Web | Not supported (logs only in console) |

---

## 🤝 Contributing
Want to improve **LogKit**? Contributions are welcome!
- Open an issue for bug reports & feature requests
- Submit a pull request with enhancements

---

## 📝 License
This project is licensed under the **MIT License**.  
See [LICENSE](LICENSE) for details.

🚀 **Enjoy logging with LogKit!** 🔥


