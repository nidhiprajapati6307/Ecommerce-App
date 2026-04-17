part of 'invitation_bloc.dart';

abstract class InvitationEvent {}

class LoadTemplatesEvent extends InvitationEvent {
  final String category;

  LoadTemplatesEvent(this.category);
}

class SelectCategoryEvent extends InvitationEvent {
  final String category;

  SelectCategoryEvent(this.category);
}

class UpdateInvitationDataEvent extends InvitationEvent {
  final String? brideName;
  final String? groomName;
  final String? eventName;
  final String? date;
  final String? time;
  final String? venue;

  UpdateInvitationDataEvent({
    this.brideName,
    this.groomName,
    this.eventName,
    this.date,
    this.time,
    this.venue,
  });
}