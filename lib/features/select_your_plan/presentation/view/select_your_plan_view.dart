import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/select_your_plan/presentation/view/widgets/select_your_plan_view_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SelectYourPlanView extends StatelessWidget {
  const SelectYourPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'اختيار باقتك',
          leadingPressed: () {
            context.pop();
          },
        ),
        body: const SafeArea(child: SelectYourPlanViewBody()),
        floatingActionButton: FloatingActionButton.extended(
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
