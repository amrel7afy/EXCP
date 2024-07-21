
import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view/select_your_plan_resident_widgets/select_your_plan_view_resident_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SelectYourPlanResidentView extends StatelessWidget {
  const SelectYourPlanResidentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'اختيار الباقة',
          leadingPressed: () {
            context.pop();
          },
        ),
        body: const SafeArea(child: SelectYourPlanResidentViewBody()),
      ),
    );
  }
}


