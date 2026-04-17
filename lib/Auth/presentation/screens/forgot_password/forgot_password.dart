import 'package:ecommerce_desi/Auth/presentation/screens/otp_screen/otp_screen.dart';
import 'package:ecommerce_desi/core/app/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/common_widgets/primary_button.dart';
import '../../../../../core/app/common_widgets/text_field.dart';
import '../../../../../core/app/common_widgets/textview.dart';
import '../../../../../core/app/utils/app_colors.dart';
import '../../../../../core/app/utils/text_style.dart';
import '../../../../core/app/routes/page_route_constants.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          Navigator.pushNamed(context, RouteNames.verifyOTPPage);
          context.read<AuthBloc>().add(AuthReset()); // optional, depends on flow
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
                    title: 'Forgot Password?',
                    textStyle: TextStyleHelper.titleLarge
                ),
                TextView(
                    title: "Don't worry! It occurs. Please enter the email address linked with your account.",
                    textStyle: TextStyleHelper.labelMedium
                ),

                const SizedBox(height: 20),


                CustomTextInputWidget(

                  hintText: "Enter your email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,

                ),
                const SizedBox(height: 20),


                PrimaryButton(
                  buttonTitle: "Send Code",
                  textColor: Colors.white,
                  buttonBgColor: AppColors.black,
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<AuthBloc>().add(ForgotPasswordSubmitted(emailController.text));

                  },

                ),

                const SizedBox(height: 20),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Remember Password?",
                        style: TextStyleHelper.labelSmall,
                      ),
                      TextSpan(
                        text: " Login",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Custom',
                          color: AppColors.colorPrimaryDark,
                        ),
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
}
