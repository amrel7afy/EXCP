
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';


class SelectYourPlanFAB extends StatelessWidget {
  const SelectYourPlanFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.pushNamed(AppRouter.designYourOfferView);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      label: SizedBox(
        width: 168.w, // Half the screen width
        child: Center(
          child: Text(
            'صمم باقة تناسبك',
            style: MyTextStyles.font14Weight500
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: MyColors.kPrimaryColor,
    );
  }
}