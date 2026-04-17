import 'package:ecommerce_desi/core/app/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/common_widgets/primary_button.dart';
import '../../../../core/app/common_widgets/textview.dart';
import '../../../../core/app/routes/page_route_constants.dart';
import '../../../../core/app/utils/app_colors.dart';
import '../../../../core/app/utils/text_style.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import 'createnew_password.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          Navigator.pushNamed(context, RouteNames.resetPasswordScreen);
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
                    title: 'OTP Verification',
                    textStyle: TextStyleHelper.titleLarge
                ),
                TextView(
                    title: "Enter the verification code we just sent on your email address.",
                    textStyle: TextStyleHelper.labelMedium
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    // final bool isFilled = index < otp.length;
                    // final bool isActive = index == otp.length && otp.length < 4;

                    return Container(
                      height: 55,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  buttonTitle: "Verify",
                  textColor: Colors.white,
                  buttonBgColor: AppColors.black,
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<AuthBloc>().add(OtpSubmitted(otpController.text));
                  },
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn’t received code?",
                        style: TextStyleHelper.labelSmall,
                      ),
                      TextSpan(
                        text: " Resend",
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
