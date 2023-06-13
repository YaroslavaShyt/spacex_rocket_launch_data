import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex_rocket_launch_data/features/home/domain/entities/rocket_entity.dart';
import 'package:spacex_rocket_launch_data/features/home/presentation/widgets/custom_dots_indicator.dart';


class Carousel extends StatefulWidget {
  final PageController pageController = PageController();
  int currentPage = 0;
  List<RocketEntity> rockets;
  Function(String) onRocketChanged;
  Carousel({Key? key, required this.rockets, required this.onRocketChanged}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            pageViewKey: const PageStorageKey<String>('carousel_slider'),
            onPageChanged: (index, reason) {
              final selectedRocket = widget.rockets[index];
              widget.onRocketChanged(selectedRocket.rocket_id ?? 'rocket id');
              setState(() {
                widget.currentPage = index;
              });
            },
          ),
          items: widget.rockets.map<Widget>((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(i.flickr_images![0]),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        CustomDotsIndicator(
          dotsCount: widget.rockets.length,
          position: widget.currentPage,
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


