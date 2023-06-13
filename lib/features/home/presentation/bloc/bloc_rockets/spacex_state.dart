part of 'spacex_bloc.dart';

abstract class SpaceXState extends Equatable {
  const SpaceXState();

  @override
  List<Object> get props => [];
}

class SpaceXInitial extends SpaceXState {}

class SpaceXSuccess extends SpaceXState {
  final List<RocketEntity> rocketsResponse;

  const SpaceXSuccess(this.rocketsResponse);

  @override
  List<Object> get props => [rocketsResponse];
}

class SpaceXError extends SpaceXState {
  final String message;

  const SpaceXError(this.message);

  @override
  List<Object> get props => [message];
}