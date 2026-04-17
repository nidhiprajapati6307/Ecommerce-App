part of 'invitation_bloc.dart';

class InvitationState extends Equatable {
  final bool isLoading;
  final String selectedCategory;
  final List<InvitationTemplateModel> templates;
  final InvitationEventData eventData;
  final String? errorMessage;

  const InvitationState({
    required this.isLoading,
    required this.selectedCategory,
    required this.templates,
    required this.eventData,
    this.errorMessage,
  });

  factory InvitationState.initial() {
    return InvitationState(
      isLoading: false,
      selectedCategory: 'Card',
      templates: const [],
      eventData: InvitationEventData.initial(),
      errorMessage: null,
    );
  }

  InvitationState copyWith({
    bool? isLoading,
    String? selectedCategory,
    List<InvitationTemplateModel>? templates,
    InvitationEventData? eventData,
    String? errorMessage,
  }) {
    return InvitationState(
      isLoading: isLoading ?? this.isLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      templates: templates ?? this.templates,
      eventData: eventData ?? this.eventData,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    selectedCategory,
    templates,
    eventData,
    errorMessage,
  ];
}