import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../common_widgets/textview.dart';
import '../utils/text_style.dart';

class CustomTextInputWidget extends StatelessWidget {
  const CustomTextInputWidget({
    super.key,
    this.title, // nullable
    required this.hintText, // required
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength = 100,
    this.prefix,
    this.suffix,
    this.allowedCharacters =
    "[a-zA-Z0-9#?!@\$%^&*-<>.,:+={};'\"`~/()_]",
  });

  final String? title; // optional
  final String hintText; // required
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool readOnly;
  final int maxLength;
  final String allowedCharacters;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Optional Title
        if (title != null)
          TextView(
            title: title!,
            margin: const EdgeInsets.only(left: AppConstants.paddingSmall),
            textStyle:  TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.blueTextColor,
            ),
          ),

        if (title != null) const SizedBox(height: AppConstants.paddingSmall),

        // Input Field
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: 1,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(allowedCharacters)),
            LengthLimitingTextInputFormatter(maxLength),
          ],
          style:  TextStyle(
            fontSize: 13,
            color: AppColors.black,
          ),
          cursorColor: AppColors.black,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.07),
            hintText: hintText,
            hintStyle:  TextStyle(
              fontSize: 13,
              color: AppColors.greyText,
            ),

            // ✅ PREFIX IMAGE / WIDGET
            prefixIcon: prefix == null
                ? null
                : IgnorePointer(
              ignoring: !enabled,
              child: Opacity(
                opacity: enabled ? 1.0 : 0.4,
                child: prefix,
              ),
            ),

            // ✅ SUFFIX IMAGE / WIDGET
            suffixIcon: suffix == null
                ? null
                : IgnorePointer(
              ignoring: !enabled,
              child: Opacity(
                opacity: enabled ? 1.0 : 0.4,
                child: suffix,
              ),
            ),
            border: _border(),
            enabledBorder: _border(),
            focusedBorder: _border(),
            disabledBorder: _border(),
          ),
        ),

        // Optional Error Text
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: TextView(
              title: errorText!,
              textStyle:  TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.redColor,
              ),
            ),
          ),
        ],
      ],
    );
  }

  // Border Helper
  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      borderSide:  BorderSide(
        color: AppColors.greyText,
        width: 1,
      ),
    );
  }
}
