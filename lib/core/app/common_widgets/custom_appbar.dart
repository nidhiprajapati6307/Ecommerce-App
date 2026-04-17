import 'package:flutter/material.dart';

import '../utils/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final double height;
  final Color backgroundColor;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.height = kToolbarHeight,
    this.backgroundColor = Colors.white,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: centerTitle,

      // 🔹 Back button with border & radius = 10
      leading: onBack != null
          ? Padding(
        padding: const EdgeInsets.only(
          left: AppConstants.paddingSmall,
        ),
        child: InkWell(
          onTap: onBack,
          child: Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black,
            ),
          ),
        ),
      )
          : null,
      title: title != null
          ? Text(
        title!,
        style: TextStyleHelper.titleSmall,
      )
          : null,

      // 🔹 Actions (optional)
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
