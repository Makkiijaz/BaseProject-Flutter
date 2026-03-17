import 'package:base_project/core/initialization/app_initalization.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  await AppInitalizer.init();
  runApp(const MyApp());
}
