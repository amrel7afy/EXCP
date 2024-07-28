import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

import '../../../../models/service_per_hour/service_class.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  final VoidCallback onTap;

  const ServiceCard(
      {super.key, required this.onTap, required this.service, });

  @override
  Widget build(BuildContext context) {
    var test='https://imgs.search.brave.com/DsjJjGVxARMz72uT_-zKGxSnb4NDr5GvDqEA8l0ah-Q/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuZnJlZWltYWdl/cy5jb20vaW1hZ2Uv/cHJldmlld3MvZGRl/L21vdGlvbi1waWN0/dXJlLW1lZ2FwaG9u/ZS1wbmctNTY5Mzk1/My5wbmc_Zm10';
     return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 365.w,

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
                  image: DecorationImage(image: NetworkImage(service.iconUrl??test),fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(14)),
            ),
            const HorizontalSpacer(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name,
                    style: MyTextStyles.font16Weight600
                        .copyWith(color: Colors.black),
                  ),
                  AutoSizeText(
                      service.description,
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
