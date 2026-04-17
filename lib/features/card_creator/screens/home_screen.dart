// import 'package:flutter/material.dart';
// import 'card_editor_screen.dart';
//
//
// class HomeScreenCard extends StatelessWidget {
//   const HomeScreenCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Shagun Samaroh")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//
//             const SizedBox(height: 30),
//
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const CardFormScreen()),
//                 );
//               },
//               child: Container(
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: Colors.orange.shade200,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Create Invitation Card",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             Container(
//               height: 120,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: const Center(
//                 child: Text(
//                   "Create Invitation Video (Coming Soon)",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }