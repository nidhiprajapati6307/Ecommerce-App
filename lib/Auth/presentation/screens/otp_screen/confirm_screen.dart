import 'package:ecommerce_desi/Auth/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app/common_widgets/primary_button.dart';
import '../../../../core/app/common_widgets/textview.dart';
import '../../../../core/app/utils/app_colors.dart';
import '../../../../core/app/utils/app_images.dart';
import '../../../../core/app/utils/text_style.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Spacer(),
            Padding(
              padding: EdgeInsets.all(AppConstants.paddingLarge),
              child: SizedBox(
                height: 100,
                  width: 100,
                  child: SvgPicture.asset(AppImages.confirm)),
            ),
            SizedBox(height: 20,),
            TextView(
                title: 'OTP Verification',
                textStyle: TextStyleHelper.labelLarge
            ),
            SizedBox(height: 10,),
            TextView(
                title: "Enter the verification code we just sent on your email address.",
                textStyle: TextStyleHelper.labelMedium
            ),
            SizedBox(height: 20,),
            PrimaryButton(
              buttonTitle: "Back to Login",
              textColor: Colors.white,
              buttonBgColor: AppColors.black,
              buttonHeight: 50,
              onPressed: (){
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
    );
  }
}
