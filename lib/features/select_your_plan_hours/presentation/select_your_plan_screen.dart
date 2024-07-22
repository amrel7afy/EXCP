
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/select_your_plan_hours/presentation/components/plan_duration_list_view.dart';

import '../../../core/widgets/custom_app_bar.dart';
import 'components/choice_chips_list_view.dart';
import 'components/expansion_list_view.dart';
import 'components/floating_action_button.dart';
import 'components/my_choice_chip.dart';

class SelectYourPlanView extends StatefulWidget {
  const SelectYourPlanView({super.key});

  @override
  State<SelectYourPlanView> createState() => _SelectYourPlanViewState();
}

class _SelectYourPlanViewState extends State<SelectYourPlanView> {
  bool is4Hours = true;
  bool isFrom8AM = true;
  bool isAM = true;

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
        body:  SafeArea(child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.k30ViewPadding),
                    child: Text(
                      "الجنسية",
                      style: MyTextStyles.font12Weight500
                          .copyWith(color: Colors.black),
                    ),
                  ),
                  const VerticalSpacer(12),
                  const NationalityChipsListView(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.k30ViewPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpacer(12),
                        Text(
                          "الفترة",
                          style: MyTextStyles.font12Weight500
                              .copyWith(color: Colors.black),
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
                  const PlanDurationChipsListView(),
                  const VerticalSpacer(17),
                ],
              ),
            ),
            const ExpansionListView(),
            const SliverToBoxAdapter(
              child: VerticalSpacer(70),
            )
          ],
        )),
        floatingActionButton: const SelectYourPlanFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                isFrom8AM = true;
              });
            },
            toggle: isFrom8AM,
            text: "من 8ص الي 10ص",
          ),
        ),
        const HorizontalSpacer(6),
        SizedBox(
          width: 117.w,
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                isFrom8AM = false;
              });
            },
            toggle: !isFrom8AM,
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


