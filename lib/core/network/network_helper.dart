import 'package:dio/dio.dart';
import '../../helper/custom_toast_helper.dart';
import 'api_exceptions.dart';
import 'dio_options.dart';

class NetworkHelper {
  final Dio _dio;

  NetworkHelper({Dio? dio})
    : _dio = dio ?? Dio(DioOptions.options) {
    // if (dio == null) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer ';
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
      ),
    );
    // }
  }

  String get _languageCode => "en";

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      final exception = NetworkException.fromDioException(e, _languageCode);
      CustomSnackbar.showSnackBar(msg: exception.toString(), isError: true);
      throw exception;
    }
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      final exception = NetworkException.fromDioException(e, _languageCode);
      CustomSnackbar.showSnackBar(msg: exception.toString(), isError: true);
      throw exception;
    }
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      final exception = NetworkException.fromDioException(e, _languageCode);
      CustomSnackbar.showSnackBar(msg: exception.toString(), isError: true);
      throw exception;
    }
  }

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      final exception = NetworkException.fromDioException(e, _languageCode);
      CustomSnackbar.showSnackBar(msg: exception.toString(), isError: true);
      throw exception;
    }
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      default:
        throw NetworkException.fromDioException(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
          ),
          _languageCode,
        );
    }
  }
}
