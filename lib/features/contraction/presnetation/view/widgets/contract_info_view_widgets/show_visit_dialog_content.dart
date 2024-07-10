import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';

import '../../../../../../core/theming/my_colors.dart';
class ShowVisitsDialogContent extends StatelessWidget {
  const ShowVisitsDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'الزيارات المتوقعة',
          style: MyTextStyles.font18Weight600
              .copyWith(color: MyColors.kPrimaryColor),
        ),
        const VerticalSpacer(17),
        ...List.generate(
          3,
              (index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 4),
              alignment: Alignment.centerRight,
              height: 44.h,
              width: getWidth(context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[400]),
              child: Text(
                'الأحد, ‏26 أغسطس 2023',
                style: MyTextStyles.font16Weight600
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
            );
          },
        ),
        const VerticalSpacer(22),
        CustomButton(
          buttonWidth: 108.w,
          textStyle: MyTextStyles.font18Weight600.copyWith(color: Colors.white),
          text: 'إغلاق',
          backGroundColor: MyColors.kPrimaryColor,
          onPressed: () {
            context.pop();

          },)
      ],
    );
  }
}