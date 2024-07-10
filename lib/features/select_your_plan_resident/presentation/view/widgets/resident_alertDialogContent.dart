import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';
import '../../../../../core/theming/styles.dart';
import '../../view_model/choose_worker_cubit/choose_worker_state.dart';
import 'choose_from_app_or_company_row.dart';


class ResidentAlertDialogContent extends StatefulWidget {
  const ResidentAlertDialogContent({
    super.key,
  });

  @override
  State<ResidentAlertDialogContent> createState() => _ResidentAlertDialogContentState();
}

class _ResidentAlertDialogContentState extends State<ResidentAlertDialogContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: BlocProvider(
  create: (context) => ChooseWorkerCubit(),
  child: Column(
    children: [
      Text(
        'كيف تريد اختيار العاملة',
        style: MyTextStyles.font18Weight600,
      ),
      const VerticalSpacer(32),
      const ChooseFromAppOrCompanyRow(),
    ],
  )
),
    );
  }
}


