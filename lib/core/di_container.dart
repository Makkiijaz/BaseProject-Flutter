import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../app/config/remote_config.dart';
import 'bloc/cubit/app_version_cubit.dart';
import 'network/dio_options.dart';
import 'network/network_helper.dart';
import 'notification/notification_helper.dart';
import 'network/network_connectivity_helper.dart';

class Di {
  static final sl = GetIt.instance;

  static Future<void> init() async {
    // External
    sl.registerLazySingleton(() => Dio(DioOptions.options));

    // Core
    sl.registerLazySingleton<NetworkHelper>(
      () => NetworkHelper(dio: sl()),
    );

    sl.registerLazySingleton(() => AppVersionCheckerCubit());
    sl.registerLazySingleton(() => NotificationHelper());
    sl.registerLazySingleton(() => NetworkConnectivityHelper());

    // Remote Config
    sl.registerLazySingleton(() => FirebaseRemoteConfig.instance);
    sl.registerLazySingleton(() => RemoteConfigService(sl()));
  }
}
