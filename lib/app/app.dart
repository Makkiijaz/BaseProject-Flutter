import 'package:flutter/material.dart';
import '../helper/custom_toast_helper.dart';
import '../routes/routes_imports.dart';
import 'constants/app_constants.dart';

final snackbarKey = CustomSnackbar.snackbarKey;
final navigatorKey = CustomSnackbar.navigatorKey;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter(navigatorKey: navigatorKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      scaffoldMessengerKey: snackbarKey,
    );
  }
}
