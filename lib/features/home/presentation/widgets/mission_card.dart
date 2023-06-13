import 'package:flutter/material.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';

class MissionCard extends StatelessWidget {
  final String date;
  final String time;
  final String name;
  final String location;

  const MissionCard({
    Key? key,
    required this.name,
    required this.time,
    required this.date,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightBlack,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
       //   mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
             //   mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      color: AppColors.acidGreen,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),

             SizedBox(
                width: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        color: AppColors.white,
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Inter',
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
