import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/select_your_plan/presentation/view/widgets/plan_duration_list_view.dart';
import 'my_choice_chip.dart';
import 'choice_chips_list_view.dart';

class SelectYourPlanViewBody extends StatefulWidget {
  const SelectYourPlanViewBody({super.key});

  @override
  State<SelectYourPlanViewBody> createState() => _SelectYourPlanViewBodyState();
}

class _SelectYourPlanViewBodyState extends State<SelectYourPlanViewBody> {
  bool is4Hours = true;
  bool isAM = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacer(24),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.k30HomeViewPadding),
            child: Text(
              "الجنسية",
              style: MyTextStyles.font12Weight500.copyWith(color: Colors.black),
            ),
          ),
          const VerticalSpacer(12),
          const NationalityChipsListView(),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.k30HomeViewPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(12),
                Text(
                  "الفترة",
                  style: MyTextStyles.font12Weight500.copyWith(color: Colors.black),
                ),
                const VerticalSpacer(12),
                buildIntervalRow(),
                const VerticalSpacer(15),
                Text(
                  "مواعيد التوصيل",
                  style: MyTextStyles.font12Weight500
                      .copyWith(color: Colors.black),
                ),
                Text(
                  "الفترة الصباحية : من 8 ص الى 5 م     الفترة المسائية : من 5 م الى 9 م",
                  maxLines: 1,
                  style: MyTextStyles.font11Weight500
                      .copyWith(color: Colors.black, height: 2.5),
                ),
                const VerticalSpacer(12),
                Text(
                  "عدد الساعات",
                  style: MyTextStyles.font12Weight500
                      .copyWith(color: Colors.black),
                ),
                const VerticalSpacer(12),
                buildHoursRow(),
                const VerticalSpacer(12),
                Text(
                  "توقيت الزيارة",
                  style: MyTextStyles.font12Weight500
                      .copyWith(color: Colors.black),
                ),
                const VerticalSpacer(12),
                buildTimeOfVisitRow(),
                const VerticalSpacer(20),
                Text(
                  "مدة الباقة",
                  style: MyTextStyles.font12Weight500
                      .copyWith(color: Colors.black),
                ),

              ],
            ),
          ),
          const VerticalSpacer(12),
          const PlanDurationChipsListView()
        ],
      ),
    );
  }

  Row buildHoursRow() {
    return Row(
      children: [
        SizedBox(
          width: 117.w,
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                is4Hours = true;
              });
            },
            toggle: is4Hours,
            text: "4 ساعة",
          ),
        ),
        const HorizontalSpacer(6),
        SizedBox(
          width: 87.w,
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                is4Hours = false;
              });
            },
            toggle: !is4Hours,
            text: '‏8 ساعة',
          ),
        )
      ],
    );
  }

  Row buildTimeOfVisitRow() {
    return Row(
      children: [
        SizedBox(
          width: 117.w,
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                is4Hours = true;
              });
            },
            toggle: is4Hours,
            text: "من 8ص الي 10ص",
          ),
        ),
        const HorizontalSpacer(6),
        SizedBox(
          width: 117.w,
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                is4Hours = false;
              });
            },
            toggle: !is4Hours,
            text: 'من10ص الي 12ص',
          ),
        )
      ],
    );
  }

  Row buildIntervalRow() {
    return Row(
      children: [
        Expanded(
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                isAM = true;
              });
            },
            toggle: isAM,
            text: 'صباحي',
          ),
        ),
        const HorizontalSpacer(6),
        Expanded(
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                isAM = false;
              });
            },
            toggle: !isAM,
            text: 'مسائي',
          ),
        )
      ],
    );
  }
}
