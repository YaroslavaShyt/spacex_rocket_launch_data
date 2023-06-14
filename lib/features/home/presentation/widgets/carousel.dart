import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/custom_dots_indicator.dart';
import 'rocket_card.dart';


class Carousel extends StatefulWidget {
  final List<RocketEntity> rockets;
  final Function(String) onRocketChanged;

  const Carousel({Key? key, required this.rockets, required this.onRocketChanged})
      : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              final selectedRocket = widget.rockets[index];
              widget.onRocketChanged(selectedRocket.rocketId ?? 'rocket id');
              setState(() {
                currentPage = index;
              });
            },
          ),
          items: widget.rockets.map<Widget>((i) => Builder(
            builder: (BuildContext context) {
              return RocketCard(image: i.flickrImages![0]);
            },
          )).toList(),
        ),
        const SizedBox(height: 16),
        CustomDotsIndicator(
          dotsCount: widget.rockets.length,
          position: currentPage,
          activeColor: Colors.white,
          inactiveColor: Colors.transparent,
          dotSize: 8.0,
          spacing: 12.0,
          borderWidth: 2.0,
          borderColor: Colors.white,
        ),
      ],
    );
  }
}
