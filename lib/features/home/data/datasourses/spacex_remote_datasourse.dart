import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/core/constants/api_urls.dart';

abstract class SpaceXRemoteDataSource {
  Future<Either<AppError, List<Map<String, dynamic>>>> getRocketsJson();
  Future<Either<AppError, List<Map<String, dynamic>>>> getMissionsJson(String rocketId);
}

class SpaceXRemoteDataSourceImpl implements SpaceXRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Either<AppError, List<Map<String, dynamic>>>> getRocketsJson() async {
    var response = await dio.get(APIEndpoints.rockets);
    if (response.statusCode == 200) {
      return Right(response.data.cast<Map<String, dynamic>>());
    }
    return Left(AppError(
        statusCode: response.statusCode.toString(),
        errorContent: response.statusMessage ??
            'Error getting data about rockets.')
    );
  }

  @override
  Future<Either<AppError, List<Map<String, dynamic>>>> getMissionsJson(
      String rocketId) async {
    var response = await dio.get('${APIEndpoints.missions}?rocket_id=$rocketId');
    if (response.statusCode == 200) {
      return Right(response.data.cast<Map<String, dynamic>>());
    }
    return Left(AppError(
        statusCode: response.statusCode.toString(),
        errorContent: response.statusMessage ??
            'Error getting data about rocket\'s missions')
    );
  }
}
