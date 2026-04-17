import 'package:flutter/material.dart';

import '../../../Auth/presentation/screens/forgot_password/forgot_password.dart';
import '../../../Auth/presentation/screens/homescreen/home_screen.dart';
import '../../../Auth/presentation/screens/login_screen/login_screen.dart';
import '../../../Auth/presentation/screens/otp_screen/createnew_password.dart';
import '../../../Auth/presentation/screens/otp_screen/otp_screen.dart';
import '../../../Auth/presentation/screens/register/register.dart';
import '../../../Auth/presentation/screens/splash_screen/splash_screen.dart';
import '../../../Auth/presentation/screens/welcome/welcome_screen.dart';
import 'page_route_constants.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case RouteNames.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteNames.registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case RouteNames.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());

      case RouteNames.verifyOTPPage:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      case RouteNames.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const CreatenewPassword());

      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route not found")),
          ),
        );
    }
  }
}
