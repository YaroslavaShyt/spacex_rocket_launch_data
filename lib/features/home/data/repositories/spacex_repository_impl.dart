import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/core/date_formatting.dart';
import 'package:spacex_rocket_launch_data/features/home/data/datasourses/spacex_remote_datasourse.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/mission_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/repositories/spacex_repository.dart';

import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';

class SpaceXRepositoryImp implements SpaceXRepository{
  final SpaceXRemoteDataSource _spaceXRemoteDataSource;
  SpaceXRepositoryImp(this._spaceXRemoteDataSource);

  @override
  Future<Either<AppError, List<MissionEntity>>> getMissionsData(String rocketId) async{
    print('before get json');
    final data = await _spaceXRemoteDataSource.getMissionsJson(rocketId);
    print('after get json');
    if (data.isRight()) {
      final currentData = data.getOrElse(() => []);
      if (currentData != []) {
        final List<MissionEntity> missionsList = [];
        for (var i in currentData) {
          missionsList.add(MissionEntity(
              missionName: i["mission_name"],
              launchDate: formatUnixDate(i["launch_date_unix"]).toString(),
              launchTime: formatUnixTime(i["launch_date_unix"]).toString(),
              launchSite: i["launch_site"]["site_name_long"].toString(),
            youtube: i["links"]["video_link"],
            wikipedia: i["links"]["wikipedia"],
            webpage: i["links"]["article_link"]
          ));
        }
        return Right(missionsList);
      }
    }
    return Left(AppError(statusCode: 'missions', errorContent: 'missions'));
  }

  @override
  Future<Either<AppError, List<RocketEntity>>> getRocketsData() async{
    final data = await _spaceXRemoteDataSource.getRocketsJson();
    if(data.isRight()){
      final currentData = data.getOrElse(() => []);
      if(currentData != []){
        final List<RocketEntity> rocketList = [];
        for (var i in currentData){
          rocketList.add(RocketEntity(
              height: i["height"],
              country: i["country"],
              id: i["id"].toString(),
              active:i["active"],
              boosters: i["boosters"],
              company: i["company"],
              cost_per_launch: i["cost_per_launch"],
              description: i["description"],
              diameter: i["diameter"],
              engine_loss_max: i["engine_loss_max"],
              engines: i["engines"],
              first_flight: i["first_flight"],
              first_stage: i["first_stage"],
              flickr_images: i["flickr_images"],
              landing_legs: i["landing_legs"],
              mass: i["mass"],
              payload_weights: i["payload_weights"],
              payloads: i["payloads"],
              propellant_1: i["propellant_1"],
              propellant_2: i["propellant_2"],
              rocket_id: i["rocket_id"],
              rocket_name: i["rocket_name"],
              rocket_type: i["rocket_type"],
              second_stage: i["second_stage"],
              stages: i["stages"],
              success_rate_pct: i["success_rate_pct"],
              thrust_sea_level: i["thrust_sea_level"],
              thrust_to_weight: i["thrust_to_weight"],
              thrust_vacuum: i["thrust_vacuum"],
              wikipedia: i["wikipedia"]));
        }
        return Right(rocketList);
      }
    }
    return Left(data.fold(
          (appError) => AppError(statusCode: appError.statusCode, errorContent: appError.errorContent), // Return the error if data is a Left
          (_) => AppError(statusCode: '500', errorContent: "Unknown error"), // Create a default error if data is a Right
    ));
  }



}