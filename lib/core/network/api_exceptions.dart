import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkException implements Exception {
  late String message;

  NetworkException([String? message]) {
    if (message != null) {
      this.message = message;
    } else {
      this.message = "Something went wrong";
    }
  }

  factory NetworkException.fromDioException(
    DioException dioException,
    String languageCode,
  ) {
    String message;
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
          languageCode,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains("SocketException")) {
          message = "No Internet connection";
          break;
        }
        message = "Unexpected error occurred";
        break;
      case DioExceptionType.badCertificate:
        message = "Bad certificate";
        break;
      case DioExceptionType.connectionError:
        message = "Connection error";
        break;
    }
    return NetworkException(message);
  }

  static String _handleError(
    int? statusCode,
    dynamic errorData,
    String languageCode,
  ) {
    try {
      if (errorData is String) {
        return errorData;
      } else if (errorData is Map<String, dynamic>) {
        if (errorData.containsKey('message')) {
          final messageData = errorData['message'];
          if (messageData is Map<String, dynamic>) {
            return messageData[languageCode] ??
                messageData['en'] ??
                "Unknown Error";
          } else {
            return messageData.toString();
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }

    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
