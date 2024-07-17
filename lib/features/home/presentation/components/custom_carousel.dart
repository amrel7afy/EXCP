import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/home/presentation/home_view_model.dart';
import 'package:test1/models/slider/slider_response.dart';

class CustomCarousel extends StatefulWidget {
  final GenericCubit<SliderResponse> sliderCubit;

  const CustomCarousel({super.key, required this.sliderCubit});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  late final CarouselController carouselController;

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final List<String> imgList = [
      'https://via.placeholder.com/400x300.png?text=Item+1',
      'https://via.placeholder.com/400x300.png?text=Item+2',
      'https://via.placeholder.com/400x300.png?text=Item+3',
    ];

    return BlocBuilder<GenericCubit<SliderResponse>,
        GenericUpdateState<SliderResponse>>(
      bloc: widget.sliderCubit,
      builder: (context, state) {

        return Column(
          children: [
            CarouselSlider(
              items: imgList.map((item) {
                return Center(
                  child: Container(
                    width: getWidth(context) * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        image: DecorationImage(
                            image: NetworkImage(state.data?.data.first.image??''),fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1.5,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              carouselController: carouselController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList
                  .asMap()
                  .entries
                  .map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme
                          .of(context)
                          .brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey)
                          .withOpacity(currentIndex == entry.key ? 0.9 : 0.2),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

