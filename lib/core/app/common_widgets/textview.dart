import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final String title;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Alignment alignment;
  final BoxDecoration decoration;

  final TextOverflow textOverflow;
  final int maxLines;

  const TextView({
    super.key,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    required this.title,
    required this.textStyle,
    this.textAlign = TextAlign.left,
    this.alignment = Alignment.centerLeft,
    this.decoration = const BoxDecoration(),
    this.textOverflow = TextOverflow.visible,
    this.maxLines = 1000,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: margin,
      alignment: alignment,
      decoration: decoration,
      child: Padding(
        padding: padding,
        child: Text(
          title,
          overflow: textOverflow,
          maxLines: maxLines,
          style: textStyle,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
