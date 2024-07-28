
import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/models/package/package_model.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';

class ExpandedContent extends StatelessWidget {
final  PackageModel package;
  final VoidCallback onTap;

  const ExpandedContent({
    super.key,
    required this.onTap, required this.package,
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
                          text: package.packagePrice?.toString(),
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
                    'عدد العاملات : ${package.employeeNumber} ${package.employeeNumberName} ',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'عدد الساعات : ${package.hoursNumber} ساعة للزيارة ',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    'عدد الزيارات : ${package.weeklyVisits} زيارة ',
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
                          text: '${package.packagePriceAfterPackageDiscount}',
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
                    'نسبة الضريبة : ${package.vatAmount?.round()}% ',
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
                    'السعر النهائي : ${package.finalPrice}  ريال',
                    style: MyTextStyles.font14Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                  const VerticalSpacer(10),
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