
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/theming/styles.dart';

import '../../core/theming/my_colors.dart';



class OverLabelContainerCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool selected;

  const OverLabelContainerCard({
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
