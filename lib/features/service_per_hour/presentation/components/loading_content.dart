import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/vertical_and_horizontal_space.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200.w,
          height: 30.h,
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
        ),
        const VerticalSpacer(17),
        Container(
          width: 365.w,
          height: 70.h,
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
        ),
        const VerticalSpacer(20),
        Container(
          width: 365.w,
          height: 70.h,
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
        ),
        const VerticalSpacer(20),
      ],
    );
  }
}
