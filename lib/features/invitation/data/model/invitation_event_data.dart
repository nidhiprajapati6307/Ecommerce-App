import 'package:equatable/equatable.dart';

class InvitationEventData extends Equatable {
  final String brideName;
  final String groomName;
  final String eventName;
  final String date;
  final String time;
  final String venue;

  const InvitationEventData({
    required this.brideName,
    required this.groomName,
    required this.eventName,
    required this.date,
    required this.time,
    required this.venue,
  });

  InvitationEventData copyWith({
    String? brideName,
    String? groomName,
    String? eventName,
    String? date,
    String? time,
    String? venue,
  }) {
    return InvitationEventData(
      brideName: brideName ?? this.brideName,
      groomName: groomName ?? this.groomName,
      eventName: eventName ?? this.eventName,
      date: date ?? this.date,
      time: time ?? this.time,
      venue: venue ?? this.venue,
    );
  }

  factory InvitationEventData.initial() {
    return const InvitationEventData(
      brideName: 'Emma',
      groomName: 'Thomas',
      eventName: 'Wedding Invitation',
      date: '12 December 2026',
      time: '7:00 PM',
      venue: 'Royal Palace, Jaipur',
    );
  }

  @override
  List<Object?> get props => [
    brideName,
    groomName,
    eventName,
    date,
    time,
    venue,
  ];
}