import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_heyflutter/model/plant.dart';

class ImageCarouselSlider extends StatelessWidget {
  final void Function(int index) onImageSlide;
  final List<Plant> plants;
  const ImageCarouselSlider({
    required this.plants,
    required this.onImageSlide,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: plants.length,
      options: CarouselOptions(
        height: double.infinity,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 2,
        ),
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          onImageSlide(index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        final image = plants[index].image;
        return Container(
          alignment: Alignment.center,
          child: Image.asset(
            image,
          ),
        );
      },
    );
  }
}
