import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';

class NationalityChip extends StatelessWidget {
  bool isSelected;
  final VoidCallback onTap;
  NationalityChip({
    super.key,
    required this.isSelected, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w ),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10),
             color:isSelected? MyColors.kPrimaryColor:Colors.grey[300]),
        child:  Text('الفلبين',style: MyTextStyles.font12Weight500.copyWith(color:isSelected? Colors.white:MyColors.kPrimaryColor),),
      ),
    );
  }
}