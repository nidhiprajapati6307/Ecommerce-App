import '../model/invitation_template_model.dart';

class InvitationLocalDataSource {
  Future<List<InvitationTemplateModel>> getTemplatesByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final allTemplates = <InvitationTemplateModel>[
      const InvitationTemplateModel(
        id: '1',
        title: 'Royal Card',
        image: 'assets/templates/card_1.jpg',
        category: 'Card',
        texts: [
          TemplateText(key: 'eventName', fontSize: 12),
          TemplateText(key: 'brideGroom', fontSize: 22),
          TemplateText(key: 'date', fontSize: 12),
          TemplateText(key: 'time', fontSize: 12),
          TemplateText(key: 'venue', fontSize: 11),
        ],
      ),
      const InvitationTemplateModel(
        id: '2',
        title: 'Elegant Card',
        image: 'assets/templates/card_2.jpg',
        category: 'Card',
        texts: [
          TemplateText(key: 'eventName', fontSize: 12),
          TemplateText(key: 'brideGroom', fontSize: 20),
          TemplateText(key: 'date', fontSize: 12),
          TemplateText(key: 'time', fontSize: 12),
          TemplateText(key: 'venue', fontSize: 11),
        ],
      ),
      const InvitationTemplateModel(
        id: '3',
        title: 'Video Template',
        image: 'assets/templates/video_1.jpg',
        category: 'Video',
        texts: [
          TemplateText(key: 'eventName', fontSize: 12),
        ],
      ),
      const InvitationTemplateModel(
        id: '4',
        title: 'PDF Template',
        image: 'assets/templates/pdf_1.jpg',
        category: 'PDF',
        texts: [
          TemplateText(key: 'eventName', fontSize: 12),
        ],
      ),
    ];

    return allTemplates.where((e) => e.category == category).toList();
  }
}