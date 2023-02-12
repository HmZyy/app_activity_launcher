import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_activity_launcher_method_channel.dart';

abstract class AppActivityLauncherPlatform extends PlatformInterface {
  /// Constructs a AppActivityLauncherPlatform.
  AppActivityLauncherPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppActivityLauncherPlatform _instance = MethodChannelAppActivityLauncher();

  /// The default instance of [AppActivityLauncherPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppActivityLauncher].
  static AppActivityLauncherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppActivityLauncherPlatform] when
  /// they register themselves.
  static set instance(AppActivityLauncherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> openApp({required String appId, Map<String, String>? extras}) {
    throw UnimplementedError('openApp() has not been implemented.');
  }

  Future<bool?> openMarket(
      {required String appId, Map<String, String>? extras}) {
    throw UnimplementedError('openMarket() has not been implemented.');
  }

  Future<bool?> openActivity(
      {required String appId, required String activity, Map<String,
          String>? extras}) {
    throw UnimplementedError('openActivity() has not been implemented.');
  }
}
