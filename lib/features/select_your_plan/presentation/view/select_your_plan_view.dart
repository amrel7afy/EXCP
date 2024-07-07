
import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/select_your_plan/presentation/view/widgets/floating_action_button.dart';
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
        floatingActionButton: const SelectYourPlanFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}


