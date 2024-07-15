
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';
import '../../view_model/choose_worker_cubit/choose_worker_state.dart';
import 'alert_dialog_select_worker_card.dart';

class ChooseFromAppOrCompanyRow extends StatefulWidget {
  const ChooseFromAppOrCompanyRow({
    super.key,
  });

  @override
  State<ChooseFromAppOrCompanyRow> createState() => _ChooseFromAppOrCompanyRowState();
}
class _ChooseFromAppOrCompanyRowState extends State<ChooseFromAppOrCompanyRow> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseWorkerCubit, ChooseWorkerState>(
      builder: (context, state) {
        return Row(
          children: [
            AlertDialogSelectWorkerCard(
              text: 'من التطبيق',
              selected: context.read<ChooseWorkerCubit>().isFromApp,
              onTap: () {
                context.read<ChooseWorkerCubit>().selectFromApp();
              },
            ),
            const Spacer(),
            AlertDialogSelectWorkerCard(
              text: 'من مقر الشركة',
              selected: !context.read<ChooseWorkerCubit>().isFromApp,
              onTap: () {
                context.read<ChooseWorkerCubit>().selectFromCompany();
              },
            ),
          ],
        );
      },
    );
  }
}
