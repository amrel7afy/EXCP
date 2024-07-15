import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
class CompanyPoliciesRow extends StatelessWidget {
  const CompanyPoliciesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.emoji_objects,
          color: MyColors.kPrimaryColor,
        ),
        const HorizontalSpacer(11),
        Text(
          'بإكمالك الخطوات فأنت توافق على ',
          style: MyTextStyles.font12Weight500
              .copyWith(color: MyColors.kPrimaryColor),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'شروط و أحكام الشركة',
            style: MyTextStyles.font12Weight500
                .copyWith(color: MyColors.kGreenColor),
          ),
        ),
      ],
    );
  }
}
