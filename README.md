# app_activity_launcher

A Flutter plugin for launching external apps and activities on Android. With this plugin, you can easily start external apps, start specific activities within apps, open the device's app store for a given app, and pass data to external apps.

## Features
- Start an external app
- Start an external app in a specific activity
- Open the device app market for a given appId
- Pass extras to external apps

## Getting Started

To use this plugin, add `app_activity_launcher` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  app_activity_launcher: ^0.0.2
```

### Start an external app
```dart
import 'package:app_activity_launcher/app_activity_launcher.dart';

var _app = AppActivityLauncher()
await _app.openApp(appId: "com.example.app"); // returns false if there was an error
```

### Start an external app in a specific activity
```dart
import 'package:app_activity_launcher/app_activity_launcher.dart';

var _app = AppActivityLauncher()
await _app.openActivity(appId: "com.example.app", activity: "MainActivity");
```

### Open the device app store for a given appId
```dart
import 'package:app_activity_launcher/app_activity_launcher.dart';

var _app = AppActivityLauncher()
await _app.openMarket(appId: "com.example.app");
```

### Pass extras to external apps
```dart
import 'package:app_activity_launcher/app_activity_launcher.dart';

var _app = AppActivityLauncher()
Map<String, String> extras = {
  "url": "https://example.com/videos/master.mp4"
};
await _app.openActivity(appId: "com.example.app", activity: "PlayerActivity", extras : extras);
```

## Contribute
If you find any bugs or have a feature request, please open an issue on GitHub. Pull requests are welcome!
