import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/core/date_formatting.dart';
import 'package:spacex_rocket_launch_data/features/home/data/datasourses/spacex_remote_datasourse.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/mission_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/repositories/spacex_repository.dart';


class SpaceXRepositoryImp implements SpaceXRepository{
  final SpaceXRemoteDataSource _spaceXRemoteDataSource;
  SpaceXRepositoryImp(this._spaceXRemoteDataSource);

  @override
  Future<Either<AppError, List<MissionEntity>>> getMissionsData(String rocketId) async{
    final data = await _spaceXRemoteDataSource.getMissionsJson(rocketId);
    if (data.isRight()) {
      final currentData = data.getOrElse(() => []);
      if (currentData != []) {
        final List<MissionEntity> missionsList = [];
        for (var i in currentData) {
          missionsList.add(MissionEntity(
              missionName: i["mission_name"],
              launchDate: formatUnixDate(i["launch_date_utc"].toString()),
              launchTime: formatUnixTime(i["launch_date_utc"].toString()),
              launchSite: i["launch_site"]["site_name_long"].toString(),
              youtube: i["links"]["video_link"],
              wikipedia: i["links"]["wikipedia"],
              webpage: i["links"]["article_link"]
          ));
        }
        return Right(missionsList);
      }
    }
    return Left(data.fold(
          (error) => error,
          (missionsJson) => AppError(
          statusCode: '',
          errorContent: 'Error getting data about rocket\'s missions'
      ),
    ));
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
              rocketId: i["rocket_id"],
              rocketName: i["rocket_name"],
              flickrImages: i["flickr_images"])
          );
        }
        return Right(rocketList);
      }
    }
    return Left(data.fold(
          (appError) => appError,
          (_) => AppError(statusCode: '', errorContent: "Error getting rocket's data"),
    ));
  }



}