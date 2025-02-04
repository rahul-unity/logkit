
# LogKit 📜🚀

**LogKit** is a simple and efficient **Flutter logging package** that extends the popular [`logger`](https://pub.dev/packages/logger) package.  
It supports **console logging**, **persistent Hive-based storage**, and **log file export**.

## 🌟 Features

✅ **Console Logging** – Uses `logger` package for structured logging  
✅ **Hive-based Log Storage** – Stores logs persistently in Hive  
✅ **Auto-delete Old Logs** – Automatically removes the previous day's logs  
✅ **Export Logs to a File** – Export logs to a `.log` text file  
✅ **Customizable Logging Levels** – Supports `debug`, `info`, `warning`, `error`, and `fatal` logs  
✅ **Works on Flutter & Dart** – Supports both mobile and desktop platforms

---

## 🛠️ Getting Started

### **1️⃣ Install the package**
Add `logkit` to your `pubspec.yaml` dependencies:
```yaml
dependencies:
  logkit: ^0.0.1  # Use the latest version
  hive: ^2.2.3
  path_provider: ^2.1.5
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
Call this in `main.dart` before using logs:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logger = UISLogger();
  await logger.initialize();  // Initialize Hive storage before logging
  runApp(const MyApp());
}
```

### **3️⃣ Log Messages**
```dart
logger.log("This is an info message");  // Default: Level.info

logger.log("Debugging details...", level: Level.debug);
logger.log("Something is wrong!", level: Level.warning);
logger.log("Critical Error!", level: Level.error);
```

### **4️⃣ Export Logs to a File**
```dart
logger.exportLogsToFile().then((path) {
  print("Logs exported to: $path");
});
```

### **5️⃣ Fetch All Logs**
```dart
List<String> logs = logger.getAllLogs();
print("All Logs: $logs");
```

---

## 🎯 Example App
Here’s a simple Flutter app that logs messages when a button is clicked.

```dart
import 'package:flutter/material.dart';
import 'package:logkit/logkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logger = UISLogger();
  await logger.initialize();  // Initialize Hive before logging
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

## 📂 Log Storage & Export
- Logs are **persistently stored** in **Hive database**.
- Previous day's logs **are automatically deleted** before inserting new logs.
- You can **export logs to a `.log` file** in the app’s document directory.

| Platform  | Log Storage Location |
|-----------|----------------------|
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
