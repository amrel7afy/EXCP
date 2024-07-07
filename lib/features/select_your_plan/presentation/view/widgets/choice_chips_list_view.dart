import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/home/presentation/view/widgets/custom_carousel.dart';
import 'package:test1/features/home/presentation/view/widgets/sevice_card.dart';

import 'nationality_chip.dart';

class NationalityChipsListView extends StatefulWidget {

  const NationalityChipsListView({super.key});

  @override
  State<NationalityChipsListView> createState() =>
      _NationalityChipsListViewState();
}

class _NationalityChipsListViewState extends State<NationalityChipsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(left: 5.w,right: index==0?AppConstants.k30ViewPadding:0),
            child: NationalityChip(
              isSelected: currentIndex == index,
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
