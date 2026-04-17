// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../../../main.dart';
//
// class CardPreviewScreen extends StatefulWidget {
//
//   final String name;
//   final String location;
//   final String date;
//   final File? imageFile;
//
//   const CardPreviewScreen({
//     super.key,
//     required this.name,
//     required this.location,
//     required this.date,
//     this.imageFile,
//   });
//
//   @override
//   State<CardPreviewScreen> createState() => _CardPreviewScreenState();
// }
//
// class _CardPreviewScreenState extends State<CardPreviewScreen> {
//
//   Color cardColor = Colors.orange;
//
//   void changeColor() {
//     setState(() {
//       cardColor =
//       Colors.primaries[DateTime.now().millisecond % Colors.primaries.length];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Your Card")),
//       body: Column(
//         children: [
//
//           const SizedBox(height: 20),
//
//           InvitationCard(
//             name: widget.name,
//             location: widget.location,
//             date: widget.date,
//             imageFile: widget.imageFile,
//             color: cardColor,
//           ),
//
//           const SizedBox(height: 20),
//
//           ElevatedButton(
//             onPressed: changeColor,
//             child: const Text("Change Color"),
//           ),
//
//           ElevatedButton(
//             onPressed: () {},
//             child: const Text("Download Card"),
//           )
//         ],
//       ),
//     );
//   }
// }