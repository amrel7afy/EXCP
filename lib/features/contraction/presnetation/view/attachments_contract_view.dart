import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/attachment_contract_view_widgets/attachment_contract_view_body.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';

class AttachmentsContractView extends StatelessWidget {
  const AttachmentsContractView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'مرفقات العقد',

        ),
        body: SafeArea(child: AttachmentsContractViewBody()),
      ),
    );
  }
}
