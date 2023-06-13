part of 'missions_bloc.dart';

abstract class MissionsEvent extends Equatable{
  const MissionsEvent();

  @override
  List<Object?> get props => [];
}

class MissionsInitiateEvent extends MissionsEvent {
  final String rocketId;
  const MissionsInitiateEvent(this.rocketId,);

  @override
  List<Object> get props => [];
}