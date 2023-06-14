import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/usecases/get_rockets.dart';
part 'rockets_event.dart';
part 'rockets_state.dart';

class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  final Rockets rockets;
  RocketsBloc({required this.rockets}) : super(RocketsInitial()) {
    on<RocketsInitiateEvent>((event, emit) async {
      final response = await rockets();
      emit(response.fold(
            (l) => RocketsError(l),
            (r) => RocketsSuccess(r),
      ));
    });
  }
}