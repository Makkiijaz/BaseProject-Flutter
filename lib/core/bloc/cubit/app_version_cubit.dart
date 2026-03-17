import 'dart:io';
import 'dart:developer';
import 'package:base_project/app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../app/app.dart';
import '../../../widgets/app_update_dialog.dart';
import '../state/app_version_state.dart';

class AppVersionCheckerCubit extends Cubit<AppVersionCheckerState> {
  AppVersionCheckerCubit() : super(AppVersionCheckerInitial());

  bool _showing = false;
  String currentAppVersion = "";

  Future<void> appInfoChecker() async {
    if (_showing) return;
    emit(AppVersionCheckerLoading());
    try {
      final pkg = await PackageInfo.fromPlatform();
      final currentSemver = _semverOnly(pkg.version);
      currentAppVersion = "v${pkg.version}+${pkg.buildNumber}";
      emit(AppVersionCheckerLoaded());

      final version = AppConstants.appVersion;
      if (version.isEmpty) {
        emit(AppVersionCheckerError('No settings loaded'));
        return;
      }

      // Pick platform-specific required version; strip any "+build"
      final rawRequired = version;
      final requiredSemver = _semverOnly(rawRequired);

      final isForce = false;
      final storeUrl = "";

      log(
        'currentSemver="$currentSemver" (${_semverCode(currentSemver)}) '
        'requiredSemver="$requiredSemver" (${_semverCode(requiredSemver)}) '
        'force=$isForce url=$storeUrl',
      );

      // Compare ONLY semantic versions
      if (_semverCode(currentSemver) < _semverCode(requiredSemver)) {
        _showing = true;

        await showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: !isForce,
          builder: (ctx) => WillPopScope(
            onWillPop: () async => !isForce,
            child: AppUpdateDialog(
              currentVersion: currentSemver,
              liveVersion: requiredSemver,
              isForceUpdate: isForce,
              appUrl: storeUrl,
              function: () {
                exit(0);
              },
            ),
          ),
          useRootNavigator: true,
        );

        _showing = false;
      }

      emit(AppVersionCheckerLoaded());
    } catch (e, st) {
      emit(AppVersionCheckerError(e.toString()));
      log('version check error: $e\n$st');
    }
  }

  String _semverOnly(String v) => v.trim().split('+').first;

  int _semverCode(String v) {
    final sem = v.trim().split('.');
    int seg(int i) => int.tryParse(sem.length > i ? sem[i] : '0') ?? 0;
    return seg(0) * 1000000 + seg(1) * 1000 + seg(2);
  }
}
