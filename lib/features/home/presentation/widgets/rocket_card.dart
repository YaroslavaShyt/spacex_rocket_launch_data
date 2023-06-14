import 'package:flutter/material.dart';

class RocketCard extends StatelessWidget {
  final String image;
  const RocketCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
