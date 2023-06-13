import 'package:flutter/material.dart';
import 'package:spacex_rocket_launch_data/core/constants/colors.dart';

class ApplicationBar extends StatelessWidget  implements PreferredSizeWidget{
  final String title;
  const ApplicationBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: Center(child:
      Stack(
        children: [
      /*    Text(title,
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Inter',
             //   fontWeight: FontWeight.w300,
                //color: AppColors.black,
                foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.deepOrangeAccent
    ),
            ),*/
          Text(title,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontFamily: 'Inter',
              //  fontWeight: FontWeight.w100,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 20.0,
                  offset: Offset(0, 1),
                )],
            ),
          ),]))
      );
  }
}
