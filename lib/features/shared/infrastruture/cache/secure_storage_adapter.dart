import 'package:flutter_application_1/core/cache/cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAdapter implements FetchSecureCacheStorage, 
  SaveSecureCacheStorage, DeleteSecureCacheStorage {

    final FlutterSecureStorage secureStorage;

    SecureStorageAdapter(this.secureStorage);
  @override
  Future<void> delete({required String key}) async {
    await secureStorage.delete(key: key);
  }

  @override
  Future<String?> fetch({required String key}) async {
   
    return await secureStorage.read(key: key);
  }

  @override
  Future<void> save({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

}