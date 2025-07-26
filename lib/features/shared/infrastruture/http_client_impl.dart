import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:dio/dio.dart';

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  HttpClientImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, T>> post<T>({
    required String url,
    required Map<String, dynamic> body,
    required Future<T> Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.post(url, data: body);

      return Right(await fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        final errorMessage = _mapDioErrorToMessage(e, e.response?.data['message'].first);
        return Left(Failure(code: e.response?.statusCode, message: errorMessage));
      } else {
        return Left(Failure(message: 'An unexpected error occurred'));
      }
    }
  }

  @override
  Future<Either<Failure, T>> get<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: headers),
        queryParameters: queryParams,
      );

      return Right(fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        final errorMessage = _mapDioErrorToMessage(e, e.response?.data['message'].first);
        return Left(Failure(code: e.response?.statusCode, message: errorMessage));
      } else {
        return Left(Failure(message: 'An unexpected error occurred'));
      }
    }
  }
}

String _mapDioErrorToMessage(DioException e, String? serverMessage) {
  if (serverMessage?.isNotEmpty == true) {
    return serverMessage!;
  }
  final statusCode = e.response?.statusCode;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout';
    case DioExceptionType.sendTimeout:
      return 'Send timeout';
    case DioExceptionType.receiveTimeout:
      return 'Receive timeout';
    case DioExceptionType.badResponse:
      if (statusCode == 400) {
        return 'Bad request';
      } else if (statusCode == 401) {
        //chama o serviço de regenerate token
        return 'Unauthorized';
      } else if (statusCode == 403) {
        return 'Forbidden';
      } else if (statusCode == 404) {
        return 'Not found';
      } else if (statusCode == 500) {
        return 'Internal server error';
      }
      return 'Unexpected error: ${e.message}';
    default:
      return 'Unexpected error: ${e.message}';
  }
}
