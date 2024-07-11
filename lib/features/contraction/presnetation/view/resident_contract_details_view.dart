
import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/resident_contract_details_widgets/contract_details_body.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view/select_your_workers_widgets/select_your_plan_view_resident_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ResidentContractDetailsView extends StatelessWidget {
  const ResidentContractDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'تفاصيل العقد',
          leadingPressed: () {
            context.pop();
          },
        ),
        body: const SafeArea(child: ResidentContractDetailsViewBody()),
      ),
    );
  }
}


