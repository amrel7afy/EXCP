import 'package:flutter/material.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/select_your_plan_view_model.dart';

import 'collapse_card.dart';

class FixedPackagesAM extends StatelessWidget {
  FixedPackagesAM({
    super.key,
  });

  final SelectYourPlanViewModel selectYourPlanViewModel =
      SelectYourPlanViewModel.instance();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CollapseCard(
          showVisitPrice: false,
          onExpandedTap: () {
            selectYourPlanViewModel.designYourFixedPlanAM(context, index);
          },
          package: selectYourPlanViewModel.fixedPackagesAM[index],
        );
      },
      itemCount: selectYourPlanViewModel.fixedPackagesAM.length,
    );
  }
}
