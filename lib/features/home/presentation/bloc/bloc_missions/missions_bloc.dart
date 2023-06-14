import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/mission_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/usecases/get_missions.dart';

part 'missions_event.dart';
part 'missions_state.dart';


class MissionsBloc extends Bloc<MissionsEvent, MissionsState>{
  final Missions missions;

  MissionsBloc({required this.missions}) : super(MissionsInitial()) {
    on<MissionsInitiateEvent>((event, emit) async {
        final response = await missions(event.rocketId);
        response.fold(
              (l) => emit(MissionsError(l)),
              (r) => emit(MissionsSuccess(r)),
        );
    });
  }
}