import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/components/widgets/loader.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/components/plan_duration_list_view.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/components/select_your_plan_tab_bar.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/select_your_plan_view_model.dart';

import '../../../core/widgets/custom_app_bar.dart';
import 'components/choice_chips_list_view.dart';
import 'components/expansion_list_view.dart';
import 'components/floating_action_button.dart';
import 'components/my_choice_chip.dart';

class SelectYourPlanScreen extends StatefulWidget {
  const SelectYourPlanScreen({super.key});

  @override
  State<SelectYourPlanScreen> createState() => _SelectYourPlanScreenState();
}

class _SelectYourPlanScreenState extends State<SelectYourPlanScreen>
    with SingleTickerProviderStateMixin {
  SelectYourPlanViewModel selectYourPlanViewModel =
      SelectYourPlanViewModel.instance();

  @override
  void initState() {
    selectYourPlanViewModel.tabController =
        TabController(length: 2, vsync: this);
    selectYourPlanViewModel.fetchFixedPackages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Loader(),
        Directionality(
          textDirection: AppConstants.appTextDirection,
          child: Scaffold(
            appBar: CustomAppBar(
              title: 'اختيار باقتك',
              leadingPressed: () {
                context.pop();
              },
            ),
            body: SafeArea(
              child: Column(
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
                        SelectYourPlanTabBar(
                          tabController: selectYourPlanViewModel.tabController,
                        ),
                        const VerticalSpacer(12),
                        SizedBox(
                          height: 400,
                          child: TabBarView(
                              controller: selectYourPlanViewModel.tabController,
                              children: const [
                                ExpansionListView(),
                                ExpansionListView(),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  /*  const VerticalSpacer(12),
                      const PlanDurationChipsListView(),*/
                  const VerticalSpacer(17),

                  // const ExpansionListView(),
                  const VerticalSpacer(70),
                ],
              ),
            ),
            floatingActionButton: const SelectYourPlanFAB(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
        ),
      ],
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
                selectYourPlanViewModel.is4Hours = true;
              });
            },
            toggle: selectYourPlanViewModel.is4Hours,
            text: "4 ساعة",
          ),
        ),
        const HorizontalSpacer(6),
        SizedBox(
          width: 87.w,
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                selectYourPlanViewModel.is4Hours = false;
              });
            },
            toggle: !selectYourPlanViewModel.is4Hours,
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
                selectYourPlanViewModel.isFrom8AM = true;
              });
            },
            toggle: selectYourPlanViewModel.isFrom8AM,
            text: "من 8ص الي 10ص",
          ),
        ),
        const HorizontalSpacer(6),
        SizedBox(
          width: 117.w,
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                selectYourPlanViewModel.isFrom8AM = false;
              });
            },
            toggle: !selectYourPlanViewModel.isFrom8AM,
            text: 'من10ص الي 12ص',
          ),
        ),
      ],
    );
  }

  Row buildIntervalRow() {
    return Row(
      children: [
        Expanded(
          child: MyChoiceChip(
            onTap: () {
              setState(
                () {
                  selectYourPlanViewModel.isAM = true;
                },
              );
            },
            toggle: selectYourPlanViewModel.isAM,
            text: 'صباحي',
          ),
        ),
        const HorizontalSpacer(6),
        Expanded(
          child: MyChoiceChip(
            onTap: () {
              setState(() {
                selectYourPlanViewModel.isAM = false;
              });
            },
            toggle: !selectYourPlanViewModel.isAM,
            text: 'مسائي',
          ),
        ),
      ],
    );
  }
}
/* Text(
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
                              ),*/
