import 'app_activity_launcher_platform_interface.dart';

class AppActivityLauncher {
  Future<String?> getPlatformVersion() {
    return AppActivityLauncherPlatform.instance.getPlatformVersion();
  }

  Future<bool?> openApp({required String appId}) {
    return AppActivityLauncherPlatform.instance.openApp(appId: appId);
  }

  Future<bool?> openMarket({required String appId}) {
    return AppActivityLauncherPlatform.instance.openMarket(appId: appId);
  }
}
