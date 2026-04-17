import 'package:ecommerce_desi/core/app/common_widgets/textview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonBgColor;
  final double buttonRadius;
  final VoidCallback? onPressed;
  final double buttonHeight;
  final double buttonWidthPercentage;
  final Color textColor;
  final Color disableTextColor;
  final double textSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final double buttonElevation;
  final Color borderColor;
  final double borderWidth;
  final bool isShowIcon;
  final bool isEnable;

  const PrimaryButton({
    Key? key,
    required this.buttonTitle,
    this.buttonBgColor = AppColors.black,
    this.buttonRadius = 8,
    this.buttonHeight = 40,
    this.buttonWidthPercentage = 1,
    required this.textColor,
    this.disableTextColor = Colors.grey,
    this.textSize = 16,
    this.fontWeight = FontWeight.w500,
    this.buttonElevation = 0,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.isShowIcon = false,
    required this.onPressed,
    this.isEnable = true, this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: double.infinity,
      child: MaterialButton(
        color: isEnable ? buttonBgColor : buttonBgColor.withOpacity(0.5),
        elevation: buttonElevation,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        onPressed: isEnable ? onPressed : null,
        child: Row(
          mainAxisAlignment:
          isShowIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            TextView(
              title: buttonTitle,
              alignment: Alignment.center,
              textStyle: TextStyle(
                fontSize: textSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                color: isEnable ? textColor : disableTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
