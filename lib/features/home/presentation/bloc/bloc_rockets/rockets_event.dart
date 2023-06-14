part of 'rockets_bloc.dart';

abstract class RocketsEvent extends Equatable{
  const RocketsEvent();

  @override
  List<Object?> get props => [];
}

class RocketsInitiateEvent extends RocketsEvent {
  const RocketsInitiateEvent();

  @override
  List<Object> get props => [];
}