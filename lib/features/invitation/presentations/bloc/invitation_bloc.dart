import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/ repository/invitation_repo.dart';
import '../../data/model/invitation_event_data.dart';
import '../../data/model/invitation_template_model.dart';

part 'invitation_event.dart';
part 'invitation_state.dart';

class InvitationBloc extends Bloc<InvitationEvent, InvitationState> {
  final InvitationRepository repository;

  InvitationBloc({required this.repository}) : super(InvitationState.initial()) {
    on<LoadTemplatesEvent>(_onLoadTemplates);
    on<SelectCategoryEvent>(_onSelectCategory);
    on<UpdateInvitationDataEvent>(_onUpdateInvitationData);
  }

  Future<void> _onLoadTemplates(
      LoadTemplatesEvent event,
      Emitter<InvitationState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final templates = await repository.getTemplatesByCategory(event.category);
      emit(state.copyWith(
        isLoading: false,
        selectedCategory: event.category,
        templates: templates,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSelectCategory(
      SelectCategoryEvent event,
      Emitter<InvitationState> emit,
      ) async {
    add(LoadTemplatesEvent(event.category));
  }

  void _onUpdateInvitationData(
      UpdateInvitationDataEvent event,
      Emitter<InvitationState> emit,
      ) {
    emit(
      state.copyWith(
        eventData: state.eventData.copyWith(
          brideName: event.brideName,
          groomName: event.groomName,
          eventName: event.eventName,
          date: event.date,
          time: event.time,
          venue: event.venue,
        ),
      ),
    );
  }
}