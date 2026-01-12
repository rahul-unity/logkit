# LogKit 📜🚀
![Pub Version](https://img.shields.io/pub/v/logkit.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Flutter Compatible](https://img.shields.io/badge/flutter-compatible-blue)
![Platforms](https://img.shields.io/badge/platforms-android%20|%20ios%20|%20web%20|%20desktop-green)


**LogKit** is a lightweight, powerful, and production-ready **Flutter logging package** that extends the popular [`logger`](https://pub.dev/packages/logger) package.  
It supports **console logging**, **Hive-based persistent storage**, and log **exporting**—on both native and web platforms.

---

## 🌟 Features

✅ Console Logging with the `logger` package  
✅ Persistent Log Storage using Hive (Filesystem on native, IndexedDB on Web)  
✅ Auto-delete logs from previous day to prevent bloat  
✅ Export logs to a `.log` file (native) or download as `.log` (web)  
✅ Supports all major log levels: `debug`, `info`, `warning`, `error`, `fatal`  
✅ Compatible with **Android, iOS, Windows, macOS, Linux, and Web (WASM)**  

---

## 🛠️ Getting Started

### ⚠️ Migrating from 1.x?

If you're upgrading from LogKit 1.x, please check the [Migration Guide](MIGRATION_GUIDE.md) for breaking changes in version 2.0.0.

### 1️⃣ Add Dependency
In your `pubspec.yaml`:
```yaml
dependencies:
  logkit: ^2.0.1  # Use the latest version
  hive: ^2.2.3
  path_provider: ^2.1.5
````

Then run:

```sh
flutter pub get
```

---

## 📌 Usage

### 🔹 Import LogKit

```dart
import 'package:logkit/logkit.dart';
```

### 🔹 Initialize Logger

Call `initialize()` before logging anything:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logkit = LogKit();
  await logkit.initialize(); // Required for Hive setup
  runApp(const MyApp());
}
```

### 🔹 Log Messages

```dart
logkit.log("This is an info message");  // Default level: info

logkit.log("Debugging details...", level: Level.debug);
logkit.log("Warning message!", level: Level.warning);
logkit.log("Something went wrong!", level: Level.error);
```

### 🔹 Export Logs

#### 🖥️ On native platforms:

```dart
String path = await logkit.exportLogsToFile();
print("Logs exported to: $path");
```

#### 🌐 On web:

```dart
await logkit.exportLogsToWebDownload(); // Triggers browser download
```

### 🔹 Get All Logs

```dart
List<String> logs = logkit.getAllLogs();
logs.forEach(print);
```

---

## 🎯 Example App

```dart
import 'package:flutter/material.dart';
import 'package:logkit/logkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logkit = LogKit();
  await logkit.initialize();
  logkit.log("App started!");

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
              final logkit = LogKit();
              logkit.log("Button clicked!", level: Level.info);
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

## 📂 Log Storage Details

| Platform                | Storage Mechanism        | Export Support             |
| ----------------------- | ------------------------ | -------------------------- |
| Android / iOS           | Hive in app document dir | Yes – via File             |
| Windows / macOS / Linux | Hive in user directory   | Yes – via File             |
| Web (WASM)              | Hive in IndexedDB        | Yes – via browser download |

---

## 🤝 Contributing

We welcome contributions!

* ✅ Report bugs via GitHub issues
* ✅ Submit PRs for improvements
* ✅ Help us improve support for new platforms or features

---

## 📝 License

This project is licensed under the **MIT License**.
See [LICENSE](LICENSE) for full details.

---

🚀 **Start logging like a pro with LogKit!** 🔥
Lightweight. Flexible. Cross-platform.


