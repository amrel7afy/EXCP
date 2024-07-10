import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/features/shared/select_worker_card.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';

class ResidentContractDetailsViewBody extends StatefulWidget {
  const ResidentContractDetailsViewBody({super.key});

  @override
  State<ResidentContractDetailsViewBody> createState() =>
      _ResidentContractDetailsViewBodyState();
}

class _ResidentContractDetailsViewBodyState
    extends State<ResidentContractDetailsViewBody> {
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
                showEitherWorkCardOrWillChooseWorkerFormCompany()
              ],
            ),
          ),
        ),
      ],
    );
  }

  showEitherWorkCardOrWillChooseWorkerFormCompany() {
    if (context.read<ChooseWorkerCubit>().isFromApp) {
      return WorkerCard(onTap: () {});
    } else {
      return Container(
        alignment: Alignment.center,
        width: getWidth(context),
          height: 79.h
        ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey[300],

        ),
      );
    }
  }
}
