import 'package:flutter/foundation.dart';

class FaKeys {
  static String get baseUrl {
    if (kReleaseMode) {
      return "base_url_production";
    } else {
      return "base_url_sandbox";
    }
  }
}
