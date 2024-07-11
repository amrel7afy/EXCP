import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/widgets/show_alert_dialog.dart';
import 'package:test1/features/select_your_plan_hours/presentation/view/widgets/collapse_card.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view/select_your_plan_resident_widgets/resident_alertDialogContent.dart';
import 'package:test1/features/shared/coupon_form_field.dart';
import 'package:test1/features/shared/over_label_container.dart';
import 'package:test1/features/shared/over_label_container_body.dart';

import '../../../../../core/constants/constants.dart';

class SelectYourPlanResidentViewBody extends StatefulWidget {
  const SelectYourPlanResidentViewBody({super.key});

  @override
  State<SelectYourPlanResidentViewBody> createState() =>
      _SelectYourPlanResidentViewBodyState();
}

class _SelectYourPlanResidentViewBodyState
    extends State<SelectYourPlanResidentViewBody> {
  List<String> nationalities = ['المجر', 'الفلبين', 'اندونيسيا'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.k21ViewPadding,
                vertical: AppConstants.k8Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OverLabelContainer(
                  label: 'الجنسية',
                  body: OverLabelContainerBody(items: nationalities),
                ),
                const VerticalSpacer(21),
                const CouponTextFormField(),
                const VerticalSpacer(15),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: AppConstants.k21ViewPadding,
                  right: AppConstants.k21ViewPadding,
                  bottom: AppConstants.k16ViewPadding),
              child:  CollapseCard(
                showVisitPrice: true, onExpandedTap: () {
                  showAlertDialog(context, const ResidentAlertDialogContent());
              },
              ),
            );
          }, childCount: 3),
        ),
      ],
    );
  }
}
