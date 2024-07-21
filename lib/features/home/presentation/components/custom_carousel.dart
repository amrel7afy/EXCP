import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';

import '../../../../models/slider/slider_item.dart';

class CustomCarousel extends StatefulWidget {
  final GenericCubit<List<SliderItem>> sliderCubit;

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
    return BlocBuilder<GenericCubit<List<SliderItem>>,
        GenericState<List<SliderItem>>>(
      bloc: widget.sliderCubit,
      builder: (context, state) {
        if (state is GenericUpdate) {
          return state.data!.isNotEmpty
              ? Column(
                  children: [
                    CarouselSlider(
                      items: state.data!.map((item) {
                        return Center(
                          child: Container(
                            width: getWidth(context) * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        state.data?.first.image ?? ''),
                                    fit: BoxFit.fill),
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
                      children: state.data!.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey)
                                  .withOpacity(
                                      currentIndex == entry.key ? 0.9 : 0.2),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )
              : Container(
                  height: 200,
                );
        } else {
          return Container(
            height: 200,
          );
        }
      },
    );
  }
}
