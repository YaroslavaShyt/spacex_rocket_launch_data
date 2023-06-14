import 'package:flutter/material.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';
import 'package:spacex_rocket_launch_data/core/constants/text_style.dart';

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
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date, style: dateStyle),
                  Text(time, style: timeStyle),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220,
                  child: Wrap(
                    children: [
                      Text(name, style: titleStyle),
                      Text(location, style: subtitleStyle)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
