import 'package:dio/dio.dart';
import '../../../../core/app/utils/basic_auth.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/secure_storage.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(DioClient client) : _dio = client.dio;

  Options _publicOptions({required String method}) {
    return Options(
      headers: {
        "Authorization": BasicAuth.createBasicAuth(), // REQUIRED
        "Method": method, // REQUIRED by your backend
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      extra: {"skipAuth": true}, // IMPORTANT: token interceptor skip
    );
  }

  String _messageFrom(dynamic data, {String fallback = "Success"}) {
    if (data is Map && data["message"] != null) return data["message"].toString();
    return fallback;
  }

  /// ✅ LOGIN
  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiConstant.login,
        data: {"email": email.trim(), "password": password},
        options: _publicOptions(method: "GetById"),
      );

      final data = response.data as Map<String, dynamic>;
      final token = data["token"]?.toString();
      if (token == null || token.isEmpty) throw "Token missing in response";

      await SecureStorage.saveToken(token);
      return _messageFrom(data, fallback: "Login Successfully");
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw e.response?.data["message"]?.toString() ?? "Login failed";
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ REGISTER
  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstant.register,
        data: {
          "name": name.trim(),
          "email": email.trim(),
          "password": password,
        },
        options: _publicOptions(method: "Insert"),
      );

      return _messageFrom(response.data, fallback: "Registration Successful");
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw e.response?.data["message"]?.toString() ?? "Register failed";
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ FORGOT PASSWORD
  /// (Usually triggers OTP flow)
  Future<String> forgotPassword(String email) async {
    try {
      final response = await _dio.post(
        ApiConstant.forgotPassword,
        data: {"email": email.trim()},
        options: _publicOptions(method: "GetById"),
      );

      return _messageFrom(response.data, fallback: "Reset code sent");
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw e.response?.data["message"]?.toString() ?? "Forgot password failed";
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ SEND OTP  (ApiConstant.otp = /email/send-otp)
  Future<String> sendOtp(String email) async {
    try {
      final response = await _dio.post(
        ApiConstant.otp,
        data: {"email": email.trim()},
        options: _publicOptions(method: "Insert"),
      );

      return _messageFrom(response.data, fallback: "OTP sent");
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw e.response?.data["message"]?.toString() ?? "OTP send failed";
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ VERIFY OTP (ApiConstant.verify = /email/verify)
  Future<String> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstant.verify,
        data: {"email": email.trim(), "otp": otp.trim()},
        options: _publicOptions(method: "GetById"),
      );

      return _messageFrom(response.data, fallback: "OTP verified");
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw e.response?.data["message"]?.toString() ?? "OTP verify failed";
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ RESET PASSWORD (ApiConstant.resetPassword = /email/reset-password)
  Future<String> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstant.resetPassword,
        data: {
          "email": email.trim(),
          "otp": otp.trim(),
          "password": password,
          "confirm_password": confirmPassword,
        },
        options: _publicOptions(method: "Update"),
      );

      return _messageFrom(response.data, fallback: "Password reset successful");
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw e.response?.data["message"]?.toString() ?? "Reset password failed";
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ LOGOUT
  Future<void> logout() async => SecureStorage.clearToken();
}
