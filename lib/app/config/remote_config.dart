import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import '../constants/fa_keys.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService(this._remoteConfig);

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: kDebugMode
            ? const Duration(minutes: 1)
            : const Duration(hours: 1),
      ),
    );
    await _remoteConfig.fetch();
    await _remoteConfig.activate();

    debugPrint("Fetch status: ${_remoteConfig.lastFetchStatus}");
    debugPrint("Fetch time: ${_remoteConfig.lastFetchTime}");

    _remoteConfig.getAll().forEach((key, value) {
      debugPrint("key: $key, value: ${value.asString()}");
    });

    debugPrint(
      "current base url for ${FaKeys.baseUrl}: ${getString(FaKeys.baseUrl)}",
    );
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }
}
