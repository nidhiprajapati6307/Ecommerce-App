import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  const LoginSubmitted({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

class RegisterSubmitted extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const RegisterSubmitted({required this.name, required this.email, required this.password});
  @override
  List<Object?> get props => [name, email, password];
}

class ForgotPasswordSubmitted extends AuthEvent {
  final String email;
  const ForgotPasswordSubmitted(this.email);
  @override
  List<Object?> get props => [email];
}

class SendOtpSubmitted extends AuthEvent {
  final String email;
  const SendOtpSubmitted(this.email);
  @override
  List<Object?> get props => [email];
}

class OtpSubmitted extends AuthEvent {
  final String otp;
  const OtpSubmitted(this.otp);
  @override
  List<Object?> get props => [otp];
}

class ResetPasswordSubmitted extends AuthEvent {
  final String password;
  final String confirmPassword;
  const ResetPasswordSubmitted({required this.password, required this.confirmPassword});
  @override
  List<Object?> get props => [password, confirmPassword];
}

class AuthReset extends AuthEvent {}
