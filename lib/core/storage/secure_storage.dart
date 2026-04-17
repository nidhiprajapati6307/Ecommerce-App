import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Single instance (industry standard)
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _tokenKey = "auth_token";

  /// Save auth token securely
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Get auth token
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }



  /// Clear auth token (logout)
  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
