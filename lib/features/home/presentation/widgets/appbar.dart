import 'package:flutter/material.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ApplicationBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.black,
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontFamily: 'Inter',
            ),
          ),
        ));
  }
}
