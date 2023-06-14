import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';
import 'package:spacex_rocket_launch_data/core/get_it.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/mission_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/bloc/bloc_missions/missions_bloc.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/bloc/bloc_rockets/rockets_bloc.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/appbar.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/carousel.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/mission_card.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/dialog.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RocketsBloc rocketsBloc;
  late MissionsBloc missionsBloc;
  PageController? pageController;

  @override
  void initState() {
    rocketsBloc = getItInstance<RocketsBloc>();
    rocketsBloc.add(const RocketsInitiateEvent());
    missionsBloc = getItInstance<MissionsBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RocketsBloc>.value(value: rocketsBloc),
        BlocProvider<MissionsBloc>.value(value: missionsBloc),
      ],
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: const ApplicationBar(title: 'SpaceX Launches'),
        body: BlocBuilder<RocketsBloc, RocketsState>(
          builder: (context, state) {
            if (state is RocketsError) {
              return CustomErrorWidget(statusCode: state.message.statusCode, description: state.message.errorContent,);
            } else if (state is RocketsSuccess) {
              return _buildRocketsSuccess(state.rocketsResponse);
            }
            return const Center(child: CircularProgressIndicator(color: AppColors.acidGreen));
          },
        ),
      ),
    );
  }

  Widget _buildRocketsSuccess(List<RocketEntity> rockets) {
    missionsBloc.add(MissionsInitiateEvent(rockets[0].rocketId ?? ''));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Carousel(
          rockets: rockets,
          onRocketChanged: (rocketId) {
            missionsBloc.add(MissionsInitiateEvent(rocketId));
          },
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'Missions',
            style: TextStyle(
              fontSize: 24,
              color: AppColors.white,
              fontFamily: 'Inter',
            ),
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<MissionsBloc, MissionsState>(
          builder: (context, missionsState) {
            if (missionsState is MissionsSuccess) {
              if (missionsState.missionsResponse.isEmpty){
                return const Center(
                    child: Text(
                      'No missions found.',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          color: AppColors.white
                      ),
                    )
                );
              } else {
                return _buildMissionsSuccess(missionsState.missionsResponse);
              }
            } else if (missionsState is MissionsError) {
              return CustomErrorWidget(statusCode: missionsState.message.statusCode, description: missionsState.message.errorContent,);
            }
            return const Center(child: CircularProgressIndicator(color: AppColors.acidGreen,));
          },
        ),
      ],
    );
  }

  Widget _buildMissionsSuccess(List<MissionEntity> missions) {
    return Expanded(
      child: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          final mission = missions[index];
          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return UrlsDialog(
                      webpage: mission.webpage ?? '',
                      wikipedia: mission.wikipedia ?? '',
                      youtube: mission.youtube ?? '',
                    );
                  },
                );
              },
              child: MissionCard(
                name: mission.missionName ?? 'text',
                time: mission.launchTime ?? 'text',
                date: mission.launchDate ?? 'text',
                location: mission.launchSite ?? 'text',
              ),
            ),
          );
        },
      ),
    );
  }
}
