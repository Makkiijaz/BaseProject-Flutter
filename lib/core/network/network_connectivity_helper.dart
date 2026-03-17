import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/text_styles.dart';

class NetworkConnectivityHelper {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  bool _isDialogShowing = false;

  void init() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      _showNoInternetDialog();
    } else {
      _dismissNoInternetDialog();
    }
  }

  void _showNoInternetDialog() {
    if (_isDialogShowing) return;

    final context = navigatorKey.currentContext;
    if (context != null) {
      _isDialogShowing = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              backgroundColor: ColorPalette.white,
              surfaceTintColor: ColorPalette.white,
              title: Row(
                children: [
                  const Icon(Icons.wifi_off, color: Colors.red),
                  const SizedBox(width: 10),
                  Text(
                    'no_internet_title',
                    style: AppTextStyles.h2(
                      context,
                    ).copyWith(color: Colors.red),
                  ),
                ],
              ),
              content: Text(
                'no_internet_message',
                style: AppTextStyles.bodyRegular(context),
              ),
            ),
          );
        },
      ).then((_) {
        _isDialogShowing = false;
      });
    }
  }

  void _dismissNoInternetDialog() {
    if (!_isDialogShowing) return;

    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.of(context, rootNavigator: true).pop();
      _isDialogShowing = false;
    }
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }
}
