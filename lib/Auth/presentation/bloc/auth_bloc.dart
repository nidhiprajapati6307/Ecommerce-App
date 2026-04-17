import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/login_repository_impl.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;

  AuthBloc(this.repo) : super(const AuthState()) {
    on<LoginSubmitted>(_login);
    on<RegisterSubmitted>(_register);
    on<ForgotPasswordSubmitted>(_forgot);
    on<SendOtpSubmitted>(_sendOtp);
    on<OtpSubmitted>(_verifyOtp);
    on<ResetPasswordSubmitted>(_resetPassword);
    on<AuthReset>((event, emit) => emit(const AuthState()));
  }

  Future<void> _login(LoginSubmitted e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));
    try {
      final msg = await repo.login(e.email, e.password);
      emit(state.copyWith(status: AuthStatus.success, message: msg));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.failure, message: err.toString()));
    }
  }

  Future<void> _register(RegisterSubmitted e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));
    try {
      final msg = await repo.register(name: e.name, email: e.email, password: e.password);
      emit(state.copyWith(status: AuthStatus.success, message: msg));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.failure, message: err.toString()));
    }
  }

  Future<void> _forgot(ForgotPasswordSubmitted e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));
    try {
      // Some backends do forgot-password only, some require send-otp too.
      final msg = await repo.forgotPassword(e.email);
      emit(state.copyWith(status: AuthStatus.success, message: msg, email: e.email));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.failure, message: err.toString()));
    }
  }

  Future<void> _sendOtp(SendOtpSubmitted e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));
    try {
      final msg = await repo.sendOtp(e.email);
      emit(state.copyWith(status: AuthStatus.success, message: msg, email: e.email));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.failure, message: err.toString()));
    }
  }

  Future<void> _verifyOtp(OtpSubmitted e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));
    try {
      final email = state.email ?? "";
      final msg = await repo.verifyOtp(email: email, otp: e.otp);
      emit(state.copyWith(status: AuthStatus.success, message: msg, otp: e.otp));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.failure, message: err.toString()));
    }
  }

  Future<void> _resetPassword(ResetPasswordSubmitted e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, message: null));
    try {
      final msg = await repo.resetPassword(
        email: state.email ?? "",
        otp: state.otp ?? "",
        password: e.password,
        confirmPassword: e.confirmPassword,
      );
      emit(state.copyWith(status: AuthStatus.success, message: msg));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.failure, message: err.toString()));
    }
  }
}
