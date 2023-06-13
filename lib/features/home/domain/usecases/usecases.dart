import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';

import '../entities/mission_entity.dart';

abstract class UseCaseRockets<Type>{
  Future<Either<AppError, List<RocketEntity>>> call();
}

abstract class UseCaseMissions<T> {
  Future<Either<AppError, T>> call(String rocketId);
}