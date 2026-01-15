import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarouselSkeleton extends StatelessWidget {
  const CarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: CarouselSlider(
        items: List.generate(
          6,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            height: 200,
          ),
        ),
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enableInfiniteScroll: true,
          pageSnapping: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
