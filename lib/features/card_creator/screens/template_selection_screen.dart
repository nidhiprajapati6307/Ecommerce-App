// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../main.dart';
// import 'card_editor_screen.dart';
//
// class TemplateSelectionScreen extends StatelessWidget {
//   const TemplateSelectionScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Select Card Template"),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(15),
//         itemCount: 4,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 15,
//           mainAxisSpacing: 15,
//         ),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => CardEditorScreen(templateIndex: index),
//                 ),
//               );
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.orange.shade100,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Center(
//                 child: Text(
//                   "Template ${index + 1}",
//                   style: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }