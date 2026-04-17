import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/invitation_bloc.dart';
import '../widgets/preview_templets.dart';
import '../widgets/template_preview_card.dart';

class TemplateSelectionPage extends StatefulWidget {
  const TemplateSelectionPage({super.key});

  @override
  State<TemplateSelectionPage> createState() => _TemplateSelectionPageState();
}

class _TemplateSelectionPageState extends State<TemplateSelectionPage> {
  final List<Map<String, dynamic>> categories = const [
    {"title": "Card", "icon": Icons.style},
    {"title": "Video", "icon": Icons.videocam},
    {"title": "PDF", "icon": Icons.picture_as_pdf},
  ];

  @override
  void initState() {
    super.initState();
    context.read<InvitationBloc>().add(LoadTemplatesEvent('Card'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Template"),
        centerTitle: true,
      ),
      body: BlocBuilder<InvitationBloc, InvitationState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    final isSelected = state.selectedCategory == item["title"];

                    return GestureDetector(
                      onTap: () {
                        context.read<InvitationBloc>().add(
                          SelectCategoryEvent(item["title"]),
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: isSelected ? 65 : 55,
                              height: isSelected ? 65 : 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: isSelected
                                    ? const LinearGradient(
                                  colors: [
                                    Color(0xFFB22222),
                                    Color(0xFF8B0000),
                                  ],
                                )
                                    : null,
                                color: isSelected ? null : Colors.grey.shade200,
                              ),
                              child: Icon(
                                item["icon"],
                                color: isSelected ? Colors.white : Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item["title"],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.red : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.errorMessage != null
                    ? Center(child: Text(state.errorMessage!))
                    : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.templates.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final template = state.templates[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          '/card-editor',
                          extra: {
                            'template': template,
                            'eventData': state.eventData,
                          },
                        );
                      },
                      child: TemplatePreviewCard(
                        template: template,
                        eventData: state.eventData,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}