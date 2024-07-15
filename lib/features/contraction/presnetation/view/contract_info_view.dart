import 'package:flutter/material.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_info_view_widgets/contract_info_view_body.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class ContractInfoView extends StatelessWidget {
  const ContractInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'بيانات التعاقد',

        ),
        body: SafeArea(child: ContractInfoViewBody()),
      ),
    );
  }
}
