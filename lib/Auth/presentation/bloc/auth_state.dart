import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? message;
  final String? email; // used in otp/reset flow
  final String? otp;

  const AuthState({
    this.status = AuthStatus.initial,
    this.message,
    this.email,
    this.otp,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? message,
    String? email,
    String? otp,
  }) {
    return AuthState(
      status: status ?? this.status,
      message: message ?? this.message,
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [status, message, email, otp];
}
