
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/features/shared/infrastruture/http_client_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../configs/constants/env/envs.dart';

part 'http_client_provider.g.dart';

@riverpod
HttpClient httpClient(Ref ref) {
  return HttpClientImpl(dio: Dio(BaseOptions(baseUrl: Environment.apiUrl)));
}