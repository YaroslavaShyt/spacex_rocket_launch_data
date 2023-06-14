part of 'rockets_bloc.dart';

abstract class RocketsState extends Equatable {
  const RocketsState();

  @override
  List<Object> get props => [];
}

class RocketsInitial extends RocketsState {}

class RocketsSuccess extends RocketsState {
  final List<RocketEntity> rocketsResponse;

  const RocketsSuccess(this.rocketsResponse);

  @override
  List<Object> get props => [rocketsResponse];
}

class RocketsError extends RocketsState {
  final AppError message;

  const RocketsError(this.message);

  @override
  List<Object> get props => [message];
}