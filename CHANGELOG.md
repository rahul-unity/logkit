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

