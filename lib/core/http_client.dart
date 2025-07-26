
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/core.dart';

abstract class HttpClient {

  Future<Either<Failure, T>> post <T>({
    required String url,
    required Map<String, dynamic> body,
    required Future<T> Function(dynamic json) fromJson,
  });


}
