import 'package:flutter/material.dart';
import '../../data/model/invitation_template_model.dart';

class InvitationTemplateCard extends StatelessWidget {
  final InvitationTemplateModel template;
  final VoidCallback onTap;

  const InvitationTemplateCard({
    super.key,
    required this.template,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          template.image,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}