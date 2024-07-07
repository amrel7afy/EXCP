import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'nationality_chips_list_view.dart';

class SelectYourPlanViewBody extends StatefulWidget {
  const SelectYourPlanViewBody({super.key});

  @override
  State<SelectYourPlanViewBody> createState() => _SelectYourPlanViewBodyState();
}

class _SelectYourPlanViewBodyState extends State<SelectYourPlanViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacer(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:AppConstants.k30HomeViewPadding),
            child: Text(
              "الجنسية",
              style: MyTextStyles.font12Weight500.copyWith(color: Colors.black),
            ),
          ),
          const VerticalSpacer(12),

          const NationalityChipsListView(),
          const VerticalSpacer(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:AppConstants.k30HomeViewPadding),
            child: Text(
              "الفترة",
              style: MyTextStyles.font12Weight500.copyWith(color: Colors.black),
            ),
          ),
          const VerticalSpacer(12),

          const VerticalSpacer(17),
        ],
      ),
    );
  }
}
