import 'package:flutter/material.dart';
import '../../app/config/remote_config.dart';
import '../di_container.dart';
import '../notification/notification_helper.dart';
import '../network/network_connectivity_helper.dart';

class AppInitalizer {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );


    await Di.init();
    await Di.sl<NotificationHelper>().init();
    Di.sl<NetworkConnectivityHelper>().init();

    // await Di.sl<RemoteConfigService>().init();
  }
}
