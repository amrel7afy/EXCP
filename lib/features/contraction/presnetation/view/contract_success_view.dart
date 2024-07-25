import 'package:flutter/material.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_success_view_widgets/contract_success_view_body.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class ContractSuccessView extends StatelessWidget {
  const ContractSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'نجاح التعاقد',

        ),
        body: SafeArea(child: ContractSuccessViewBody()),
      ),
    );
  }
}
