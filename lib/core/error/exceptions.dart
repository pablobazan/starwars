import 'dart:io';

import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  final int statusCode;
  const ServerException(this.message, {this.statusCode = 200});
}

class NetworkException implements Exception {}

class CacheException implements Exception {}

class AuthenticationException implements Exception {}

class PayloadTooLargeException implements Exception {}

class NotFoundException implements Exception {}

class ExceptionUtils {
  static Exception getExceptionFromStatusCode(DioError error) {
    if (error.error is IOException ||
        error.type == DioErrorType.connectionTimeout) {
      return NetworkException();
    } else if (error.response!.statusCode == HttpStatus.unauthorized ||
        error.response!.statusCode == HttpStatus.forbidden) {
      return AuthenticationException();
    } else {
      return _throwByStatusCode(error);
    }
  }

  static Exception _throwByStatusCode(DioError error) {
    const noMessageError = 'no error message';

    try {
      var httpError = error.response!.statusCode;

      switch (httpError) {
        case 413:
          return PayloadTooLargeException();
        case 404:
          return NotFoundException();
        default:
          return ServerException(error.message ?? noMessageError,
              statusCode: error.response!.statusCode!);
      }
    } catch (_) {
      return ServerException(error.message ?? noMessageError,
          statusCode: error.response!.statusCode!);
    }
  }
}
