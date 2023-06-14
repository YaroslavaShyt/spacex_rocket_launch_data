part of 'missions_bloc.dart';

abstract class MissionsState extends Equatable {
  const MissionsState();

  @override
  List<Object> get props => [];
}

class MissionsInitial extends MissionsState {}

class MissionsSuccess extends MissionsState {
  final List<MissionEntity> missionsResponse;

  const MissionsSuccess(this.missionsResponse);

  @override
  List<Object> get props => [missionsResponse];
}

class MissionsError extends MissionsState {
  final AppError message;

  const MissionsError(this.message);

  @override
  List<Object> get props => [message];
}