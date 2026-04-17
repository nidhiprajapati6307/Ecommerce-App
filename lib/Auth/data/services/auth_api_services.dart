import 'package:dio/dio.dart';
import '../../../../core/app/utils/basic_auth.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/secure_storage.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(DioClient client) : _dio = client.dio;

  /// ✅ LOGIN
  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiConstant.login,
        data: {
          "email": email.trim(),
          "password": password,
        },
        options: Options(
          headers: {
            "Authorization": BasicAuth.createBasicAuth(),
            "Method": "GetById",
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          extra: {"skipAuth": true},
        ),
      );

      final data = response.data as Map<String, dynamic>;
      final token = data["token"]?.toString();
      if (token == null || token.isEmpty) throw "Token missing in response";

      await SecureStorage.saveToken(token);
      return data["message"]?.toString() ?? "Login Successfully";
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw (e.response?.data["message"]?.toString() ?? "Login failed");
      }
      throw "Network error. Please try again.";
    } catch (e) {
      throw e.toString();
    }
  }

  /// ✅ REGISTER (add endpoint already in ApiConstant)
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
        options: Options(
          headers: {
            "Authorization": BasicAuth.createBasicAuth(),
            "Method": "Insert", // ⚠️ if backend expects different, change
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          extra: {"skipAuth": true},
        ),
      );

      final data = response.data as Map<String, dynamic>;
      return data["message"]?.toString() ?? "Registration Successful";
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw (e.response?.data["message"]?.toString() ?? "Register failed");
      }
      throw "Network error. Please try again.";
    } catch (e) {
      throw e.toString();
    }
  }

  /// ✅ FORGOT PASSWORD
  Future<String> forgotPassword(String email) async {
    try {
      final response = await _dio.post(
        ApiConstant.forgotPassword,
        data: {"email": email.trim()},
        options: Options(
          headers: {
            "Authorization": BasicAuth.createBasicAuth(),
            "Method": "GetById", // ⚠️ backend rule; change if needed
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          extra: {"skipAuth": true},
        ),
      );

      final data = response.data as Map<String, dynamic>;
      return data["message"]?.toString() ?? "OTP sent";
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw (e.response?.data["message"]?.toString() ?? "Forgot password failed");
      }
      throw "Network error. Please try again.";
    } catch (e) {
      throw e.toString();
    }
  }

  /// ✅ OTP VERIFY (endpoint not in ApiConstant -> add if you have)
  Future<String> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        "/auth/verify-otp", // ✅ add in ApiConstant later
        data: {"email": email.trim(), "otp": otp.trim()},
        options: Options(
          headers: {
            "Authorization": BasicAuth.createBasicAuth(),
            "Method": "GetById",
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          extra: {"skipAuth": true},
        ),
      );

      final data = response.data as Map<String, dynamic>;
      return data["message"]?.toString() ?? "OTP Verified";
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw (e.response?.data["message"]?.toString() ?? "OTP verify failed");
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ RESET PASSWORD (endpoint not in ApiConstant -> add if you have)
  Future<String> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dio.post(
        "/auth/reset-password", // ✅ add in ApiConstant later
        data: {
          "email": email.trim(),
          "otp": otp.trim(),
          "password": password,
          "confirm_password": confirmPassword,
        },
        options: Options(
          headers: {
            "Authorization": BasicAuth.createBasicAuth(),
            "Method": "Update", // ⚠️ change if backend expects another
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          extra: {"skipAuth": true},
        ),
      );

      final data = response.data as Map<String, dynamic>;
      return data["message"]?.toString() ?? "Password Reset Successful";
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        throw (e.response?.data["message"]?.toString() ?? "Reset password failed");
      }
      throw "Network error. Please try again.";
    }
  }

  /// ✅ LOGOUT
  Future<void> logout() async => SecureStorage.clearToken();
}
