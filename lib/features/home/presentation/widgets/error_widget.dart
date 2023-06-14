import 'package:flutter/material.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';
import 'package:spacex_rocket_launch_data/core/constants/text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  final String statusCode;
  final String description;
  const CustomErrorWidget({Key? key, required this.statusCode, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: AppColors.lightBlack,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Error:', style: titleStyle,),
              Text(statusCode, style: dateStyle,),
              Wrap(children: [Text(description, style: subtitleStyle,)])
            ],
          ),
        ),
    );
  }
}
