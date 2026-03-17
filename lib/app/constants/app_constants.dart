import '../../core/di_container.dart';
import '../config/remote_config.dart';
import 'fa_keys.dart';

class AppConstants {
  static const String appName = "Base Project";
  static const String appVersion = "1.0.0";
  static String baseUrl = Di.sl<RemoteConfigService>().getString(
    FaKeys.baseUrl,
  );
}
