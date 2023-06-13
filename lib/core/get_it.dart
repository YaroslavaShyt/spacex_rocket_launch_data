import 'package:get_it/get_it.dart';
import 'package:spacex_rocket_launch_data/features/home/data/datasourses/spacex_remote_datasourse.dart';
import 'package:spacex_rocket_launch_data/features/home/data/repositories/spacex_repository_impl.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/repositories/spacex_repository.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/usecases/get_missions.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/usecases/get_rockets.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/bloc/bloc_missions/missions_bloc.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/bloc/bloc_rockets/spacex_bloc.dart';

final getItInstance = GetIt.I;

Future init() async{
  getItInstance.registerLazySingleton<SpaceXRemoteDataSource>(() => SpaceXRemoteDataSourceImpl());
  getItInstance.registerLazySingleton<SpaceXRepository>(() => SpaceXRepositoryImp(getItInstance()));
  getItInstance.registerLazySingleton<Rockets>(() => Rockets(getItInstance()));
  getItInstance.registerFactory<SpaceXBloc>(() => SpaceXBloc(rockets: getItInstance()));

  getItInstance.registerLazySingleton<Missions>(() => Missions(getItInstance()));
  getItInstance.registerFactory<MissionsBloc>(() => MissionsBloc(missions: getItInstance()));
}