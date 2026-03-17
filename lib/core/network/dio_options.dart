import 'package:dio/dio.dart';

import '../../app/constants/app_constants.dart';

class DioOptions {
  static BaseOptions get options {
    return BaseOptions(
      baseUrl: AppConstants.baseUrl.isEmpty
          ? ""
          : AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
  }
}
