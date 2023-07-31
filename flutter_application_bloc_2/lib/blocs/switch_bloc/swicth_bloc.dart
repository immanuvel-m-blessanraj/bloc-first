import 'package:equatable/equatable.dart';
import 'package:flutter_application_bloc_2/blocs/bloc_export.dart';

part 'swicth_event.dart';
part 'swicth_state.dart';

class SwicthBloc extends HydratedBloc<SwicthEvent, SwicthState> {
  SwicthBloc() : super(const SwicthInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const SwicthState(switchValue: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(const SwicthState(switchValue: false));
    });
  }

  @override
  SwicthState? fromJson(Map<String, dynamic> json) {
    return SwicthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwicthState state) {
    return state.toMap();
  }
}
