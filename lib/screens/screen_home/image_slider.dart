// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _dotIndex = 0;

  final _items = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img5.jpg',
  ];

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    //data for center dot at screen width
    Size size = MediaQuery.of(context).size;
    double _dotSize = 5;
    double _dotSpace = 5;
    int _dotnumber = _items.length;
    double _dotToCenter() {
      double centerOfScreenwidth = (size.width / 2);
      double sizeOfDotsBlock =
          ((_dotnumber * _dotSize + _dotSpace * (_dotnumber - 1)) / 2);
      return centerOfScreenwidth - sizeOfDotsBlock / 2;
    }

    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: _items.length,
          itemBuilder: (context, index, realIndex) {
            final _item = _items[index];
            return Image.asset(
              _item,
              fit: BoxFit.fill,
              width: double.infinity,
            );
          },
          options: CarouselOptions(
            height: 150,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              return setState(() => _dotIndex = index);
            },
          ),
        ),
        Positioned(
          bottom: 7,
          left: _dotToCenter(),
          child: AnimatedSmoothIndicator(
            activeIndex: _dotIndex,
            count: _items.length,
            onDotClicked: animateToSlide,
            effect: const SlideEffect(
              dotHeight: 5,
              dotWidth: 5,
              activeDotColor: Colors.blue,
              dotColor: Colors.white,
              spacing: 5,
            ),
          ),
        ),
      ],
    );
  }

  animateToSlide(int index) => controller.animateToPage(index);
}
