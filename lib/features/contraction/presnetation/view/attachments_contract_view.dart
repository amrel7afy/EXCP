import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/attachment_contract_view_widgets/attachment_contract_view_body.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_download_view_widgets/contract_download_view_body.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_success_view_widgets/contract_success_view_body.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';

class AttachmentsContractView extends StatelessWidget {
  const AttachmentsContractView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'مرفقات العقد',
          leadingPressed: () {
            context.pop();
          },
        ),
        body: const SafeArea(child: AttachmentsContractViewBody()),
      ),
    );
  }
}
