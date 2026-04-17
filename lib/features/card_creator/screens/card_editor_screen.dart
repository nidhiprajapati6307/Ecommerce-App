// import 'dart:io';
// import 'package:ecommerce_desi/features/card_creator/screens/preview_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CardFormScreen extends StatefulWidget {
//   const CardFormScreen({super.key});
//
//   @override
//   State<CardFormScreen> createState() => _CardFormScreenState();
// }
//
// class _CardFormScreenState extends State<CardFormScreen> {
//
//   final nameController = TextEditingController();
//   final locationController = TextEditingController();
//   final dateController = TextEditingController();
//
//   File? imageFile;
//
//   final picker = ImagePicker();
//
//   Future pickImage() async {
//     final picked = await picker.pickImage(source: ImageSource.gallery);
//
//     if (picked != null) {
//       setState(() {
//         imageFile = File(picked.path);
//       });
//     }
//   }
//
//   void createCard() {
//
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => CardPreviewScreen(
//           name: nameController.text,
//           location: locationController.text,
//           date: dateController.text,
//           imageFile: imageFile,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Fill Card Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: "Name"),
//             ),
//
//             TextField(
//               controller: locationController,
//               decoration: const InputDecoration(labelText: "Location"),
//             ),
//
//             TextField(
//               controller: dateController,
//               decoration: const InputDecoration(labelText: "Date"),
//             ),
//
//             const SizedBox(height: 20),
//
//             ElevatedButton(
//               onPressed: pickImage,
//               child: const Text("Upload Photo"),
//             ),
//
//             const SizedBox(height: 30),
//
//             ElevatedButton(
//               onPressed: createCard,
//               child: const Text("Create Card"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }