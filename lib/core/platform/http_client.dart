import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:starwars/core/error/exceptions.dart';
import 'package:starwars/core/platform/network_info.dart';

abstract class HttpClient {
  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters});

  Future<Response<dynamic>> post(
    String path,
    data,
  );
}

class HttpClientImpl implements HttpClient {
  final NetworkInfo connection;
  // final url = 'https://swapi.dev/api';
  late BaseOptions _options;

  bool isNotValidResponse(int statusCode) =>
      statusCode != HttpStatus.ok && statusCode != HttpStatus.created;

  HttpClientImpl({required this.connection}) {
    _options = BaseOptions(
      // baseUrl: url,
      connectTimeout: 25000,
      receiveTimeout: 30000,
    );
  }

  Future<Dio> _getDio() async {
    var dio = Dio(_options);

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestBody: false,
          requestHeader: true,
          responseBody: true,
          responseHeader: false));
    }
    return dio;
  }

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final dio = await _getDio();
      if (!await connection.isConnected) {
        throw const SocketException('');
      }
      final response = await dio.get(path, queryParameters: queryParameters);
      if (isNotValidResponse(response.statusCode!)) {
        throw ServerException(response.data['message'],
            statusCode: response.statusCode!);
      }
      return response;
    } on DioError catch (error) {
      throw ExceptionUtils.getExceptionFromStatusCode(error);
    }
  }

  @override
  Future<Response> post(String path, data) async {
    try {
      final dio = await _getDio();
      if (!await connection.isConnected) {
        throw const SocketException('');
      }
      final response = await dio.post(path, data: data);
      if (isNotValidResponse(response.statusCode!)) {
        throw ServerException(response.data['message'],
            statusCode: response.statusCode!);
      }
      return response;
    } on DioError catch (error) {
      throw ExceptionUtils.getExceptionFromStatusCode(error);
    }
  }
}
