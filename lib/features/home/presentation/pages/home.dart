import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';
import 'package:spacex_rocket_launch_data/core/get_it.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/bloc/bloc_missions/missions_bloc.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/bloc/bloc_rockets/spacex_bloc.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/appbar.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/carousel.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/mission_card.dart';

import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SpaceXBloc spaceXBloc;
  late MissionsBloc missionsBloc;
  PageController? pageController;

  @override
  void initState() {
    spaceXBloc = getItInstance<SpaceXBloc>();
    spaceXBloc.add(const SpaceXInitiateEvent());
    missionsBloc = getItInstance<MissionsBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SpaceXBloc>.value(value: spaceXBloc),
        BlocProvider<MissionsBloc>.value(value: missionsBloc),
      ],
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: const ApplicationBar(title: 'SpaceX Launches'),
        body: BlocConsumer<SpaceXBloc, SpaceXState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SpaceXError) {
              return const Text('error');
            } else if (state is SpaceXSuccess) {
              return Column(
                children: [
                  BlocBuilder<SpaceXBloc, SpaceXState>(
                    builder: (context, state) {
                      if (state is SpaceXError) {
                        return const Text('error');
                      } else if (state is SpaceXSuccess) {
                        missionsBloc.add(MissionsInitiateEvent(state.rocketsResponse[0].rocket_id ?? ''));
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Carousel(rockets:state.rocketsResponse, onRocketChanged:  (rocketId) {
                             missionsBloc.add(MissionsInitiateEvent(rocketId));
                           },),
                            const SizedBox(height: 16),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Missions',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors.white,
                                  fontFamily: 'Inter'
                              ),),
                            ),
                          ],
                        );
                      } else if (state is MissionsError) {
                        return const Text('Error loading missions');
                      }
                      return const SizedBox();
                    },
                  ),
                //  const SizedBox(height: 16),
                  BlocBuilder<MissionsBloc, MissionsState>(
                    builder: (context, missionsState) {
                      if (missionsState is MissionsSuccess) {
                        final missions = missionsState.missionsResponse;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: missions.length,
                            itemBuilder: (context, index) {
                              final mission = missions[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                                child: GestureDetector(
                                  onTap: (){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return UrlsDialog(
                                            webpage: mission.webpage ?? '',
                                            wikipedia: mission.wikipedia ?? '',
                                            youtube: mission.youtube ?? '',
                                          );
                                        });
                                  },
                                  child: MissionCard(
                                      name: mission.missionName ?? 'text',
                                      time: mission.launchTime ?? 'text',
                                      date: mission.launchDate ?? 'text',
                                      location: mission.launchSite ?? 'text'
                                  ),
                                ),
                              );

                            },
                          ),
                        );
                      }
                      else if (missionsState is MissionsError) {
                        return const Text('Error loading missions');
                      }
                      return const Center(child: CircularProgressIndicator(),);
                    },
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

