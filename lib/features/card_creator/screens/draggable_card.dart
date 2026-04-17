import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DraggableText extends StatefulWidget {
  @override
  _DraggableTextState createState() => _DraggableTextState();
}

class _DraggableTextState extends State<DraggableText> {

  Offset position = Offset(120, 300);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onPanUpdate: (details) {
        setState(() {
          position += details.delta;
        });
      },

      child: Text(
        "Rahul & Priya",
        style: GoogleFonts.greatVibes(
          fontSize: 40,
          color: Colors.white,
        ),
      ),

    );
  }
}