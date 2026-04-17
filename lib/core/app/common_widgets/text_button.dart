import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Alignment alignment;
  final BoxDecoration decoration;

  const AppTextButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.margin = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.decoration = const BoxDecoration(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        borderRadius: decoration.borderRadius as BorderRadius?,
        onTap: onTap,
        child: Ink(
          decoration: decoration,
          child: Container(
            padding: padding,
            alignment: alignment,
            child: Text(
              title,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
