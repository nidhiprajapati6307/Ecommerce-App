import 'package:ecommerce_desi/Auth/presentation/screens/login_screen/login_screen.dart';
import 'package:ecommerce_desi/core/app/common_widgets/custom_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app/common_widgets/primary_button.dart';
import '../../../../../core/app/common_widgets/text_field.dart';
import '../../../../../core/app/common_widgets/textview.dart';
import '../../../../../core/app/utils/app_colors.dart';
import '../../../../../core/app/utils/app_images.dart';
import '../../../../../core/app/utils/text_style.dart';
import '../../../../core/app/routes/page_route_constants.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import '../forgot_password/forgot_password.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          Navigator.pushReplacementNamed(context, RouteNames.loginPage);
          context.read<AuthBloc>().add(AuthReset());
        }

        if (state.status == AuthStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Registration failed")),
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          onBack: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              children: [
                SizedBox(height: 10),
                TextView(
                    title: 'Hello! Register to get started...',
                    textStyle: TextStyleHelper.titleLarge
                ),

                const SizedBox(height: 20),

                CustomTextInputWidget(
                  hintText: "User name",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),

                CustomTextInputWidget(
                  hintText: "Enter your email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),

                // Password Field
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

                ),
                const SizedBox(height: 10),

                CustomTextInputWidget(
                  hintText: "Confirm Password",
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(
                  height: 20,
                ),

                PrimaryButton(
                  buttonTitle: "Register",
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      RegisterSubmitted(
                        name: nameController.text,
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
                        "Or Register with",
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
                        text: "Already have an account? ",
                        style: TextStyleHelper.labelSmall,
                      ),
                      TextSpan(
                        text: "Login Now",
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
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),


              ],

            ),
          ),
        ),
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