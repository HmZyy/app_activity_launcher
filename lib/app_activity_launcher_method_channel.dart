import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_activity_launcher_platform_interface.dart';

/// An implementation of [AppActivityLauncherPlatform] that uses method channels.
class MethodChannelAppActivityLauncher extends AppActivityLauncherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_activity_launcher');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
