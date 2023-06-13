part of 'spacex_bloc.dart';

abstract class SpaceXEvent extends Equatable{
  const SpaceXEvent();

  @override
  List<Object?> get props => [];
}

class SpaceXInitiateEvent extends SpaceXEvent {
  const SpaceXInitiateEvent();

  @override
  List<Object> get props => [];
}