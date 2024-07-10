
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';
import '../../view_model/choose_worker_cubit/choose_worker_state.dart';
import 'alert_dialog_select_worker_card.dart';
class ChooseDeliverToHomeOrFromCompanyRow extends StatelessWidget {
  const ChooseDeliverToHomeOrFromCompanyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseWorkerCubit, ChooseWorkerState>(
      builder: (context, state) {
        return Row(
          children: [
            AlertDialogSelectWorkerCard(
              text: 'توصيل للمنزل',
              selected: context.read<ChooseWorkerCubit>().isDelivery,
              subText: 'مصاريف التوصيل 80 ريال',
              onTap: () {
                context.read<ChooseWorkerCubit>().selectDelivery();
              },
            ),
            const Spacer(),
            AlertDialogSelectWorkerCard(
              text: 'من مقر الشركة',
              selected: !context.read<ChooseWorkerCubit>().isDelivery,
              onTap: () {
                context.read<ChooseWorkerCubit>().selectWillFromCompany();
              },
            ),
          ],
        );
      },
    );
  }
}