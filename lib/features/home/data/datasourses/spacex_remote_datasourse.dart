import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:spacex_rocket_launch_data/core/app_rerror_entity.dart';
import 'package:spacex_rocket_launch_data/core/constants/api_urls.dart';

abstract class SpaceXRemoteDataSource{
  Future<Either<AppError, List<Map<String, dynamic>>>> getRocketsJson();
  Future<Either<AppError, List<Map<String, dynamic>>>> getMissionsJson(String rocketId);
}

class SpaceXRemoteDataSourceImpl implements SpaceXRemoteDataSource{
  Dio dio = Dio();


  @override
  Future<Either<AppError, List<Map<String, dynamic>>>> getRocketsJson() async{
    var response = await dio.get(APIEndpoints.rockets);
  //  print(response.statusCode);
    if(response.statusCode == 200){
 //     print(response.data);
      return Right(response.data.cast<Map<String, dynamic>>());
    }
    return Left(AppError(statusCode: response.statusCode.toString(), errorContent: response.statusMessage ?? ''));
  }

  @override
  Future<Either<AppError, List<Map<String, dynamic>>>> getMissionsJson(String rocketId) async{
    print('before get missions: $rocketId');
    var response = await dio.get('${APIEndpoints.missions}?rocket_id=$rocketId');
    print(response.statusCode);
    if(response.statusCode == 200){
      print(response.data);
      return Right(response.data.cast<Map<String, dynamic>>());
    }
    return Left(AppError(statusCode: response.statusCode.toString(), errorContent: response.statusMessage ?? ''));
  }

}