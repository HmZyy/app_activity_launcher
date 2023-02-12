
import 'app_activity_launcher_platform_interface.dart';

class AppActivityLauncher {
  Future<String?> getPlatformVersion() {
    return AppActivityLauncherPlatform.instance.getPlatformVersion();
  }
}
