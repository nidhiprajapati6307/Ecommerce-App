import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InvitationTypePage extends StatelessWidget {
  const InvitationTypePage({super.key});

  Widget invitationCard(
      BuildContext context,
      String title,
      String subtitle,
      IconData icon,
      List<Color> gradient,
      String route,
      ) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: gradient.last.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Create Invitation"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          invitationCard(
            context,
            "Wedding Card",
            "Create beautiful wedding invitation card",
            Icons.favorite,
            const [Color(0xFF8B0000), Color(0xFFB22222)],
            '/template-selection',
          ),
          invitationCard(
            context,
            "Wedding Video",
            "Generate animated wedding invitation video",
            Icons.videocam,
            const [Color(0xFF4A148C), Color(0xFF7B1FA2)],
            '/template-selection',
          ),
          invitationCard(
            context,
            "Wedding PDF",
            "Download invitation as printable PDF",
            Icons.picture_as_pdf,
            const [Color(0xFF004D40), Color(0xFF00796B)],
            '/template-selection',
          ),
        ],
      ),
    );
  }
}