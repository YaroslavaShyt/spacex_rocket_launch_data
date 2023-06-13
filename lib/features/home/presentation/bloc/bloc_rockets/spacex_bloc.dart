import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_rockets.dart';
part 'spacex_event.dart';
part 'spacex_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  final Rockets rockets;
  SpaceXBloc({required this.rockets}) : super(SpaceXInitial()) {
    on<SpaceXInitiateEvent>((event, emit) async {
      final response = await rockets();
      emit(response.fold(
            (l) => SpaceXError('Error'),
            (r) => SpaceXSuccess(r),
      ));
    });
  }
}