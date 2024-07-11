import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/widgets/show_alert_dialog.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';

class ExpandedContent extends StatelessWidget {
  final VoidCallback onTap;

  const ExpandedContent({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: MyColors.kAppBarBackGroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 1,
              height: 0,
              color: MyColors.kPrimaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(11),
                  RichText(
                    text: TextSpan(
                      text: 'سعر الباقة: ',
                      style: MyTextStyles.font14Weight500.copyWith(
                          color: MyColors.kPrimaryColor, fontSize: 14),
                      children: [
                        TextSpan(
                          text: '12,800.00',
                          style: MyTextStyles.font14Weight500.copyWith(
                            color: MyColors.kGreenColor,
                          ),
                        ),
                        TextSpan(
                            text: ' ريال ',
                            style: MyTextStyles.font14Weight500.copyWith(
                                color: MyColors.kPrimaryColor, fontSize: 14))
                      ],
                    ),
                  ),
                  Text(
                    'عدد العاملات : 1 عاملة ',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'عدد الساعات : 4 ساعة للزيارة ',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'عدد الزيارات : 1 زيارة ',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'السعر بعد الخصم: ',
                      style: MyTextStyles.font14Weight500.copyWith(
                        color: MyColors.kPrimaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: '800.00',
                          style: MyTextStyles.font14Weight500.copyWith(
                            color: MyColors.kGreenColor,
                          ),
                        ),
                        TextSpan(
                            text: ' ريال ',
                            style: MyTextStyles.font14Weight500.copyWith(
                              color: MyColors.kPrimaryColor,
                              height: 1.5,
                            ))
                      ],
                    ),
                  ),
                  Text(
                    'نسبة الضريبة : 15% ',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'قيمة الضريبة للسعر النهائي : 5220  ريال',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'السعر النهائي : 5220  ريال',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  VerticalSpacer(10),
                  Text(
                    'السعر شامل الضريبة والخصم',
                    style: MyTextStyles.font12Weight500.copyWith(
                      color: MyColors.kGreenColor,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(20)
          ],
        ),
      ),
    );
  }
}
