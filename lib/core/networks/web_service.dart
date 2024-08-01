import 'package:dio/dio.dart';

import '../utils/app_shared_utils.dart';

// Abstract class representing a generic web service.
abstract class WebService {
  // Method for making a GET request.
  Future<dynamic> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  // Method for making a POST request.
  Future<dynamic> postRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  // Method for making a PUT request.
  Future<dynamic> putRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data,
  });

  // Method for making a DELETE request.
  Future<dynamic> deleteRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  });
}

// Implementation of the WebService interface using Dio.
class WebServiceWithDioImpl implements WebService {
  WebServiceWithDioImpl({Map<String, dynamic>? headers, String? baseUrl}) {
    _init(headers: headers, baseUrl: baseUrl);
  }

  Dio? _dio;

  // Method to initialize the Dio object.
  void _init({Map<String, dynamic>? headers, String? baseUrl}) {
    final base = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {Headers.contentTypeHeader: Headers.jsonContentType});

    _dio = Dio(base.copyWith(
      baseUrl: baseUrl ?? base.baseUrl,
      headers: {...base.headers, ...headers ?? {}},
    ));
  }

  @override
  Future<dynamic> getRequest(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio!.get(path, queryParameters: queryParameters);
     //print(response);

      return response.data;

    } on DioException catch (error) {
      throw AppSharedUtils.getCustomExceptionBasedOnDioException(error);
    }
  }

  @override
  Future<dynamic> postRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? langCode,
  }) async {
    try {
      final response =
      await _dio!.post(path, queryParameters: queryParameters, data: data);
      return response.data;
    } on DioException catch (error) {
      throw AppSharedUtils.getCustomExceptionBasedOnDioException(error);
    }
  }

  @override
  Future<dynamic> putRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data,
  }) async {
    try {
      final response =
      await _dio!.put(path, queryParameters: queryParameters, data: data);
      return response.data;
    } on DioException catch (error) {
      throw AppSharedUtils.getCustomExceptionBasedOnDioException(error);
    }
  }

  @override
  Future<dynamic> deleteRequest(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
      await _dio!.delete(path, queryParameters: queryParameters, data: {});
      return response.data;
    } on DioException catch (error) {
      throw AppSharedUtils.getCustomExceptionBasedOnDioException(error);
    }
  }
}
