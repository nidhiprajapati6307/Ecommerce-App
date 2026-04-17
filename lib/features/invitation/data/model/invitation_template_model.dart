import 'package:equatable/equatable.dart';

class InvitationTemplateModel extends Equatable {
  final String id;
  final String title;
  final String image;
  final String category;
  final List<TemplateText> texts;

  const InvitationTemplateModel({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.texts,
  });

  @override
  List<Object?> get props => [id, title, image, category, texts];
}

class TemplateText extends Equatable {
  final String key;
  final double fontSize;

  const TemplateText({
    required this.key,
    required this.fontSize,
  });

  @override
  List<Object?> get props => [key, fontSize];
}