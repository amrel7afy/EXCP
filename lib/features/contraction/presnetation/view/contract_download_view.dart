import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_download_view_widgets/contract_download_view_body.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class DownloadContractView extends StatelessWidget {
  const DownloadContractView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'تفاصيل العقد',

        ),
        body: const SafeArea(child: DownloadContractViewBody()),
      ),
    );
  }
}
