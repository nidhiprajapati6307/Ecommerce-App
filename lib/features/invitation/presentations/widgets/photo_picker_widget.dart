import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerWidget extends StatefulWidget {
  const PhotoPickerWidget({super.key});

  @override
  State<PhotoPickerWidget> createState() => _PhotoPickerWidgetState();
}

class _PhotoPickerWidgetState extends State<PhotoPickerWidget> {

  File? image;

  pick() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: pick,
      child: image == null
          ? Container(
        width: 100,
        height: 100,
        color: Colors.grey.shade300,
        child: const Icon(Icons.add_a_photo),
      )
          : Image.file(image!, width: 100, height: 100),
    );
  }
}