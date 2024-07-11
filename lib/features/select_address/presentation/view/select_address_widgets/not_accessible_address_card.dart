import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

import '../../../../../core/constants/methods.dart';
import '../../../../../core/theming/my_colors.dart';

class NotAccessibleAddressCard extends StatelessWidget {
  const NotAccessibleAddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children: [
            const VerticalSpacer(16),
            Container(
              height: 115.h,
              width: getWidth(context),
              padding: const EdgeInsets.only(left: 22, right: 22, top: 23),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: MyColors.kAppBarBackGroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.6,
                    child: AutoSizeText(
                      'شارع الامام مالك بن انس، الريان، الخرج 16439، السعودية',
                      style: MyTextStyles.font16Weight500.copyWith(
                        color: MyColors.kPrimaryColor,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    'لا يمكن خدمتكم في هذا العنوان',
                    style: MyTextStyles.font14Weight500
                        .copyWith(color: Colors.red, height: 2),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}