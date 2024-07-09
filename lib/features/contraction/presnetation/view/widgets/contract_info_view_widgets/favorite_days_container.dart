import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/theming/styles.dart';

import '../../../../../../core/theming/my_colors.dart';

class FavoriteDaysContainer extends StatelessWidget {
  const FavoriteDaysContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(width: 1.2),
              borderRadius: BorderRadius.circular(10)),
          width: getWidth(context),
          child: const FavoriteDays(),
        ),
        Positioned(
          top: -10,
          right: 10,
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            width: 120.w,
            child: Text(
              'الأيام المفضلة',
              style: MyTextStyles.font14Weight500,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteDays extends StatefulWidget {
  const FavoriteDays({
    super.key,
  });

  @override
  State<FavoriteDays> createState() => _FavoriteDaysState();
}

class _FavoriteDaysState extends State<FavoriteDays> {
  final List<String> weekDays = [
    'السبت',
    'الاحد',
    'الاثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(weekDays.length, (int index) {
          return DayCard(
            weekDay: weekDays[index],
            selected: currentIndex == index,
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
          );
        }));
  }
}

class DayCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool selected;

  const DayCard({
    super.key,
    required this.weekDay,
    required this.onTap,
    required this.selected,
  });

  final String weekDay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 4, left: 3),
          width: 117.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selected ? MyColors.kPrimaryColor : Colors.grey,
          ),
          child: Center(
              child: Text(
                weekDay,
                style: MyTextStyles.font12Weight500.copyWith(
                    color: selected ? MyColors.kPinkColor : MyColors.kPrimaryColor),
              ))),
    );
  }
}