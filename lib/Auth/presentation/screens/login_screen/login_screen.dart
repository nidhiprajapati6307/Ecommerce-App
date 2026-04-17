import 'package:ecommerce_desi/core/app/common_widgets/textview.dart';
import 'package:ecommerce_desi/core/app/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app/common_widgets/custom_appbar.dart';
import '../../../../../core/app/common_widgets/primary_button.dart';
import '../../../../../core/app/common_widgets/text_field.dart';
import '../../../../../core/app/routes/page_route_constants.dart';
import '../../../../../core/app/utils/text_style.dart';
import '../../../../core/app/utils/app_colors.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import '../forgot_password/forgot_password.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBack: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.paddingMedium),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message ?? "Login failed")),
              );
            }

            if (state.status == AuthStatus.success) {
              Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
              context.read<AuthBloc>().add(AuthReset());
            }
          },
          builder: (context, state) {
            final isLoading = state.status == AuthStatus.loading;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextView(
                      title: 'Welcome back! Glad to see you, Again!',
                      textStyle: TextStyleHelper.titleLarge
                  ),
                  SizedBox(
                    height: 20,
                  ),
              
                  CustomTextInputWidget(
                    hintText: "Enter your email",
                    controller: emailController,
                    enabled: !isLoading,
                    onChanged: (_) {
                      context.read<AuthBloc>().add(AuthReset());
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
              
                  CustomTextInputWidget(
                    hintText: "Enter your password",
                    controller: passwordController,
                    obscureText: true,
                    suffix: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        AppImages.eye_open,
                      ),
                    ),
                    enabled: !isLoading,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          );
                        },
                        child: TextView(
                          title: 'Forgot Password?',
                          textStyle: TextStyleHelper.labelSmall,
                        ),
                      ),
                    ],
                  ),
              
                  PrimaryButton(
                    buttonTitle: isLoading ? "Please wait..." : "Login",
                    onPressed: isLoading
                        ? null
                        : () {
                      context.read<AuthBloc>().add(
                        LoginSubmitted(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    textColor: AppColors.whiteColor,
                    buttonHeight: 50,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(),
                      ),
              
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingSmall, // ✅ your padding
                        ),
                        child: Text(
                          "Or Login with",
                          style: TextStyleHelper.labelSmall, // ✅ your text style
                        ),
                      ),
              
                      const Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _socialLoginButton(
                        asset: 'assets/icons/google1.svg',
                        label: 'Google',
                        onTap: () {},
                      ),
                      _socialLoginButton(
                        asset: 'assets/icons/facebook.svg',
                        label: 'Facebook',
                        onTap: () {},
                      ),
                      _socialLoginButton(
                        asset: 'assets/icons/email.svg',
                        label: 'Email',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyleHelper.labelSmall,
                        ),
                        TextSpan(
                          text: "Register Now",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Custom',
                            color: AppColors.NewColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
              
              
              
                ],
              ),
            );
          },
        )

      ),
    );
  }

  Widget _socialLoginButton({
    required String asset,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      onTap: onTap,
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.paddingSmall,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              asset,
              width: AppConstants.iconSizeMedium,
              height: AppConstants.iconSizeMedium,
            ),
            const SizedBox(height: AppConstants.paddingXSmall),
            Text(
              label,
              style: TextStyleHelper.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

}