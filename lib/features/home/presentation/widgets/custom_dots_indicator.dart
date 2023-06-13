import 'package:flutter/material.dart';


class CustomDotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int position;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;
  final double borderWidth;
  final Color borderColor;

  const CustomDotsIndicator({
    super.key,
    required this.dotsCount,
    required this.position,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
    this.dotSize = 12.0,
    this.spacing = 2.0,
    this.borderWidth = 0.1,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotsCount, (index) {
        final isActive = index == position;
        return Container(
          width: dotSize + borderWidth * 2,
          height: dotSize + borderWidth * 2,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? activeColor : borderColor,
              width: 1,
            ),
          ),
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? activeColor : inactiveColor,
            ),
          ),
        );
      }),
    );
  }
}
