# Migration Guide: LogKit 1.x to 2.0.0

This guide will help you migrate your code from LogKit 1.x to LogKit 2.0.0.

## ⚠️ Breaking Changes

Version 2.0.0 introduces breaking changes to improve naming consistency:

1. **Class renamed**: `UISLogger` → `LogKit`
2. **Variable naming convention**: All examples and documentation now use `logkit` instead of `logger`

---

## 📋 Step-by-Step Migration

### Step 1: Update Package Version

In your `pubspec.yaml`, update the package version:

```yaml
dependencies:
  logkit: ^2.0.0  # Update from ^1.0.0
```

Then run:
```bash
flutter pub get
```

---

### Step 2: Update Class Name

Replace all instances of `UISLogger` with `LogKit`.

#### Before (1.x):
```dart
import 'package:logkit/logkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logger = UISLogger();
  await logger.initialize();
  logger.log("App started");
  runApp(const MyApp());
}
```

#### After (2.0.0):
```dart
import 'package:logkit/logkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logkit = LogKit();
  await logkit.initialize();
  logkit.log("App started");
  runApp(const MyApp());
}
```

---

### Step 3: Update Variable Names (Recommended)

While not strictly required, we recommend updating variable names from `logger` to `logkit` for consistency with the package name.

#### Before (1.x):
```dart
final logger = UISLogger();
await logger.initialize();
logger.log("User logged in");
logger.log("Error occurred", level: Level.error);
String path = await logger.exportLogsToFile();
List<String> logs = logger.getAllLogs();
```

#### After (2.0.0):
```dart
final logkit = LogKit();
await logkit.initialize();
logkit.log("User logged in");
logkit.log("Error occurred", level: Level.error);
String path = await logkit.exportLogsToFile();
List<String> logs = logkit.getAllLogs();
```

---

## 🔍 Find and Replace

You can use find and replace in your IDE to speed up the migration:

### Find and Replace Patterns:

1. **Class name**:
   - Find: `UISLogger`
   - Replace: `LogKit`

2. **Variable name** (optional but recommended):
   - Find: `final logger =`
   - Replace: `final logkit =`
   
   - Find: `logger.`
   - Replace: `logkit.`

⚠️ **Note**: Be careful when replacing `logger.` as it might match other logger-related code. Use your IDE's "Replace in Files" feature with context-aware matching.

---

## 📝 Complete Example Migration

### Before (1.x):
```dart
import 'package:flutter/material.dart';
import 'package:logkit/logkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logger = UISLogger();
  await logger.initialize();
  logger.log("App started!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("My App")),
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

### After (2.0.0):
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
        appBar: AppBar(title: const Text("My App")),
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

## ✅ Verification Checklist

After migration, verify:

- [ ] Package version updated to `^2.0.0` in `pubspec.yaml`
- [ ] All `UISLogger` references changed to `LogKit`
- [ ] All variable names updated (if following the new convention)
- [ ] Code compiles without errors
- [ ] All logging functionality works as expected
- [ ] Tests pass (if you have tests)

---

## 🆘 Need Help?

If you encounter any issues during migration:

1. Check the [CHANGELOG.md](CHANGELOG.md) for detailed changes
2. Review the [README.md](README.md) for updated examples
3. Open an issue on [GitHub](https://github.com/rahul-unity/logkit/issues)

---

## 📚 Additional Notes

- **API Methods**: All method names remain the same (`initialize()`, `log()`, `exportLogsToFile()`, `getAllLogs()`, etc.)
- **Functionality**: No functional changes - only naming updates
- **Backward Compatibility**: Version 1.x code will not work with 2.0.0 due to the class name change

---

**Happy Migrating! 🚀**

