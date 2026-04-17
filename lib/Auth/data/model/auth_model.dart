// class LoginRequest {
//   final String email;
//   final String password;
//
//   LoginRequest({required this.email, required this.password});
//
//   Map<String, dynamic> toJson() => {
//     "email": email,
//     "password": password,
//   };
// }
//
// class RegisterRequest {
//   final String name;
//   final String email;
//   final String password;
//
//   RegisterRequest({
//     required this.name,
//     required this.email,
//     required this.password,
//   });
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "email": email,
//     "password": password,
//   };
// }
//
// class ForgotPasswordRequest {
//   final String email;
//
//   ForgotPasswordRequest({required this.email});
//
//   Map<String, dynamic> toJson() => {"email": email};
// }
//
// class VerifyOtpRequest {
//   final String email;
//   final String otp;
//
//   VerifyOtpRequest({required this.email, required this.otp});
//
//   Map<String, dynamic> toJson() => {
//     "email": email,
//     "otp": otp,
//   };
// }
//
// class ResetPasswordRequest {
//   final String email;
//   final String otp; // or token (depends on your backend)
//   final String password;
//   final String confirmPassword;
//
//   ResetPasswordRequest({
//     required this.email,
//     required this.otp,
//     required this.password,
//     required this.confirmPassword,
//   });
//
//   Map<String, dynamic> toJson() => {
//     "email": email,
//     "otp": otp,
//     "password": password,
//     "confirm_password": confirmPassword,
//   };
// }
//
// /// Common API response
// class ApiResponse<T> {
//   final bool success;
//   final String message;
//   final T? data;
//
//   ApiResponse({
//     required this.success,
//     required this.message,
//     this.data,
//   });
//
//   factory ApiResponse.fromJson(
//       Map<String, dynamic> json,
//       T Function(dynamic dataJson)? fromData,
//       ) {
//     return ApiResponse(
//       success: json["success"] ?? true,
//       message: json["message"]?.toString() ?? "",
//       data: fromData != null ? fromData(json["data"]) : null,
//     );
//   }
// }
//
// /// Example login response data
// class AuthData {
//   final String? token;
//   final Map<String, dynamic>? user;
//
//   AuthData({this.token, this.user});
//
//   factory AuthData.fromJson(dynamic json) {
//     if (json is! Map<String, dynamic>) return AuthData();
//     return AuthData(
//       token: json["token"]?.toString(),
//       user: json["user"] is Map<String, dynamic> ? json["user"] : null,
//     );
//   }
// }
