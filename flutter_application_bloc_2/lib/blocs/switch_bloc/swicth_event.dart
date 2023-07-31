part of 'swicth_bloc.dart';

abstract class SwicthEvent extends Equatable {
  const SwicthEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwicthEvent {}

class SwitchOffEvent extends SwicthEvent {}
