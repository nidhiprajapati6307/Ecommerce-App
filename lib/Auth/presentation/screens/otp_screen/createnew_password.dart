import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/common_widgets/custom_appbar.dart';
import '../../../../core/app/common_widgets/primary_button.dart';
import '../../../../core/app/common_widgets/text_field.dart';
import '../../../../core/app/common_widgets/textview.dart';
import '../../../../core/app/routes/page_route_constants.dart';
import '../../../../core/app/utils/app_colors.dart';
import '../../../../core/app/utils/text_style.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import 'confirm_screen.dart';
import 'otp_screen.dart';

class CreatenewPassword extends StatefulWidget {
  const CreatenewPassword({super.key});

  @override
  State<CreatenewPassword> createState() => _CreatenewPasswordState();
}

class _CreatenewPasswordState extends State<CreatenewPassword> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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

      },
      child: Scaffold(
        appBar: CustomAppBar(
          onBack: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              children: [
                SizedBox(height: 10),
                TextView(
                    title: 'Create new password',
                    textStyle: TextStyleHelper.titleLarge
                ),
                TextView(
                    title: "Your new password must be unique from those previously used.",
                    textStyle: TextStyleHelper.labelMedium
                ),

                const SizedBox(height: 20),


                CustomTextInputWidget(
                  hintText: "Create new Password",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,

                ),
                const SizedBox(height: 20),

                CustomTextInputWidget(
                  hintText: "Confirm Password",
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),


                PrimaryButton(
                  buttonTitle: "Reset Password",
                  textColor: Colors.white,
                  buttonBgColor: AppColors.black,
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      ResetPasswordSubmitted(
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                      ),
                    );

                  },

                ),

              ],

            ),
          ),
        ),

      ),
    );;
  }
}
