## [1.0.3] - 2025-05-23

### 🛠 Fixes & Enhancements
- Fixed issue where newly logged entries were not shown in `getAllLogs()` by introducing `getLatestLogs()` with Hive reinitialization.
- Added option to listen to log updates using `Hive.box('logs').listenable()` for real-time UI updates.
- Improved documentation for web export and Hive behavior.
- 
## [1.0.2] - 2025-02-05
### 🛠 Static Analysis Cleanup
- Suppressed deprecation warning for `dart:html` using `ignore_for_file`
- Ran `dart format .` to fix file formatting issues

## [1.0.1] - 2025-02-05
### 🛠 Metadata Update & Platform Support

- Declared **web platform compatibility** explicitly in `pubspec.yaml` using the `platforms:` section
- This enables the `WEB` platform tag to appear on [pub.dev](https://pub.dev/packages/logkit)
- No code changes, just metadata improvements for platform visibility

## [1.0.0] - 2025-02-05
### 🎉 Stable Release (Production Ready)

- 🚀 First stable release of **LogKit**.
- ✅ Unified logging for Flutter (mobile, desktop, web).
- ✅ Hive-based persistent logging with daily log cleanup.
- ✅ Console logging using the `logger` package.
- ✅ `exportLogsToFile()` for native platforms.
- ✅ `exportLogsToWebDownload()` for browser log downloads.
- ✅ Fully supports WebAssembly (WASM) — no `dart:io` usage in web.

### 🛠 Technical Highlights
- Uses `Hive` for cross-platform log persistence.
- Automatically deletes previous day's logs.
- Lightweight, customizable log levels.
- Compatible with all Flutter platforms.

## [0.0.4] - 2025-02-05
### 🛠 Fixes & Improvements
- Improved **code formatting** and **lint compliance**.

## [0.0.3] - 2025-02-05
### 🛠 Fixes & Improvements
- Removed **unused imports (`defaultTargetPlatform`, `TargetPlatform`)** to pass static analysis.
- Improved **code formatting** and **lint compliance**.
- Ran `flutter analyze` to ensure **0 warnings and errors**.
- Disabled **file-based logging** when running on WebAssembly (WASM).
- Ensured **no `dart:io` usage** in WASM environments.
- `exportLogsToFile()` now gracefully fails on WASM instead of crashing.

## [0.0.2] - 2025-02-04
### 🚀 New Features
- Integrated **Hive-based log storage** instead of file-based logging.
- Added **automatic deletion of previous day's logs** before inserting new logs.
- Implemented **log export to a text file (`.log`)** for easy sharing.
- Logs are now **persistently stored** and available across app sessions.

### 🐛 Bug Fixes
- Fixed an issue where logs were not correctly initialized before first usage.
- Resolved a bug where log timestamps were incorrectly formatted in some time zones.
- Improved error handling for **file storage permissions** on mobile and desktop.

### ⚡ Improvements
- Optimized **log retrieval performance** with Hive indexing.
- Added better **timestamp formatting** for logs.
- Improved **logger initialization process** to prevent early failures.

## [0.0.1] - 2025-02-04
### 🚀 New Features
- Added **custom log file directory support**.
- Implemented **log rotation** to keep only the last 7 days of logs.

### 🐛 Bug Fixes
- Fixed an issue where logs were not created on Windows.
- Improved error handling when file permissions are restricted.

### ⚡ Improvements
- Optimized file writing for better performance.
- Added better formatting for log timestamps.

