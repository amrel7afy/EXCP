import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_state.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/select_your_plan_view_model.dart';

import 'fixed_packages_am.dart';

class ExpansionListView extends StatefulWidget {
  const ExpansionListView({super.key});

  @override
  State<ExpansionListView> createState() => _ExpansionListViewState();
}

class _ExpansionListViewState extends State<ExpansionListView> {
  SelectYourPlanViewModel selectYourPlanViewModel = SelectYourPlanViewModel.instance();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
      bloc: selectYourPlanViewModel.genericCubit,
      builder: (context, state) {

          return  FixedPackagesAM();

      },
    );
  }
}


