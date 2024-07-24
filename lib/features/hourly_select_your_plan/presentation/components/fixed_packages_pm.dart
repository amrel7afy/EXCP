import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/select_your_plan_view_model.dart';
import '../../../../controller/hourly_contract/hourly_contract_controller.dart';
import 'collapse_card.dart';

class FixedPackagesPM extends StatelessWidget {
  FixedPackagesPM({
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
            selectYourPlanViewModel.designYourFixedPlanPM(context,index);
          },
          package: selectYourPlanViewModel.fixedPackagesPM[index],
        );
      },
      itemCount: selectYourPlanViewModel.fixedPackagesPM.length,
    );
  }
}
