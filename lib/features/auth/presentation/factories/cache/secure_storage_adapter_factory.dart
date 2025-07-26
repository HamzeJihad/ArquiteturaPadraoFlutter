


import 'package:flutter_application_1/features/shared/infrastruture/cache/secure_storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

SecureStorageAdapter makeSecureStorageAdapter() {
  return SecureStorageAdapter(FlutterSecureStorage());
}