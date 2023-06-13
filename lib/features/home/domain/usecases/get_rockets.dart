import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/repositories/spacex_repository.dart';
import 'usecases.dart';


class Rockets implements UseCaseRockets{
  final SpaceXRepository _spaceXRepository;

  Rockets(this._spaceXRepository);

  @override
  Future<Either<AppError, List<RocketEntity>>> call() =>
      _spaceXRepository.getRocketsData();
}