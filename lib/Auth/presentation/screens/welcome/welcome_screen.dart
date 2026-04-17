import 'package:ecommerce_desi/Auth/presentation/screens/homescreen/home_screen.dart';
import 'package:ecommerce_desi/Auth/presentation/screens/login_screen/login_screen.dart';
import 'package:ecommerce_desi/Auth/presentation/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/app/common_widgets/primary_button.dart';
import '../../../../../../core/app/common_widgets/text_button.dart';
import '../../../../../../core/app/utils/app_colors.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img.png',
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Bottom Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
              child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      SvgPicture.asset('assets/svg/icon.svg'),
                      const SizedBox(height: 10),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Fruzz",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "digital",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),

                      PrimaryButton(
                        buttonTitle: "Login",
                        textColor: Colors.white,
                        buttonBgColor: AppColors.black,
                        buttonHeight: 50,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                        buttonTitle: "Register",
                        textColor: AppColors.black,
                        buttonBgColor: AppColors.whiteColor,
                        borderColor: AppColors.black,
                        borderWidth: 1,
                        buttonHeight: 50,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterScreen()),
                          );
                        }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppTextButton(
                        title: "Continue as a Guest",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                        textStyle: TextStyle(
                          color: AppColors.colorPrimaryDark,
                          fontSize: 14,
                          fontFamily: 'Custom',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],


            ),
          ),
          ) ],
      ),
    );
  }
}

