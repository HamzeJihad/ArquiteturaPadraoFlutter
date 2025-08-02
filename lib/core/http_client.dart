import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';

abstract class HttpClient {
  Future<Either<Failure, T>> post<T>({
    required String url,
    required Map<String, dynamic> body,
    required Future<T> Function(dynamic json) fromJson,
  });

  Future<Either<Failure, T>> get<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    required T Function(dynamic json) fromJson,
  });
  
}

 


