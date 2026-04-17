abstract class SwitchEvent {
  SwitchEvent();
  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent{}

class SliderEvent extends SwitchEvent{
  double silder;

  SliderEvent({required this.silder});

  @override
  List<Object> get props => [silder];
}