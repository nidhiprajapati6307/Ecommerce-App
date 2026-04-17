import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvitationTemplate extends StatelessWidget {
  final String name;
  final String location;
  final String date;
  final Color color;
  final File? imageFile;

  const InvitationTemplate({
    super.key,
    required this.name,
    required this.location,
    required this.date,
    required this.color,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 500,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageFile != null)
            CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(imageFile!),
            ),
          const SizedBox(height: 20),
          Text(
            name.isEmpty ? "Your Name" : name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            location.isEmpty ? "Location" : location,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            date.isEmpty ? "Event Date" : date,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}