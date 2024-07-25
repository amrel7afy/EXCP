import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/select_your_plan_view_model.dart';

import 'fixed_packages_pm.dart';

class ExpansionListViewPM extends StatefulWidget {
  const ExpansionListViewPM({super.key});

  @override
  State<ExpansionListViewPM> createState() => _ExpansionListViewPMState();
}

class _ExpansionListViewPMState extends State<ExpansionListViewPM> {
  SelectYourPlanViewModel selectYourPlanViewModel = SelectYourPlanViewModel.instance();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
      bloc: selectYourPlanViewModel.genericCubit,
      builder: (context, state) {

          return  FixedPackagesPM();

      },
    );
  }
}


