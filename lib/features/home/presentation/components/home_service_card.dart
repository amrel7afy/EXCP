
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

class HomeServiceCard extends StatelessWidget {
  final String image = '';
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const HomeServiceCard({super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 365.w,
        height: 70.h,
        padding: EdgeInsets.all(7.w),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              height: 52.h,
              width: 52.w,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(14)),
            ),
            const HorizontalSpacer(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MyTextStyles.font16Weight600
                        .copyWith(color: Colors.black),
                  ),
                  AutoSizeText(
                    subTitle,
                    style: MyTextStyles.font12Weight600
                        .copyWith(color: Colors.black),
                    minFontSize: 10.sp,
                    stepGranularity: 0.5.sp,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
