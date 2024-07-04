import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  @override
  Widget build(BuildContext context) {
    final CarouselController _carouselController = CarouselController();
    int _currentIndex = 0;
    final List<String> imgList = [
      'https://via.placeholder.com/400x300.png?text=Item+1',
      'https://via.placeholder.com/400x300.png?text=Item+2',
      'https://via.placeholder.com/400x300.png?text=Item+3',
    ];

    return  Column(
      children: [CarouselSlider(
        items: imgList.map((item) {
          return Center(
            child: Container(
              width: getWidth(context) * 0.7,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        carouselController: _carouselController,
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.grey)
                      .withOpacity(_currentIndex == entry.key ? 0.9 : 0.2),
                ),
              ),
            );
          }).toList(),
        ),],
    );
  }
}

