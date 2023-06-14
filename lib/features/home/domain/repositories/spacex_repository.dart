import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/mission_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';


abstract class SpaceXRepository{
  Future<Either<AppError, List<RocketEntity>>> getRocketsData();
  Future<Either<AppError, List<MissionEntity>>> getMissionsData(String rocketId);
}