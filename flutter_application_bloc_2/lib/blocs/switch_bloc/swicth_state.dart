part of 'swicth_bloc.dart';

class SwicthState extends Equatable {
  final bool switchValue;
  const SwicthState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return {"switchValue": switchValue};
  }

  factory SwicthState.fromMap(Map<String, dynamic> map) {
    return SwicthState(switchValue: map["switchValue"] ?? false);
  }
}

class SwicthInitial extends SwicthState {
  const SwicthInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
