import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/mission_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/repositories/spacex_repository.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/mission_entity.dart';
import 'usecases.dart';


class Missions implements UseCaseMissions<List<MissionEntity>> {
  final SpaceXRepository _spaceXRepository;

  Missions(this._spaceXRepository);

  @override
  Future<Either<AppError, List<MissionEntity>>> call(String rocketId) =>
      _spaceXRepository.getMissionsData(rocketId);
}