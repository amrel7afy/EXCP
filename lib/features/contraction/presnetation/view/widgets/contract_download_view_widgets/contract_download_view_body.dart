import 'package:flutter/material.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_download_view_widgets/upload_docs_later_row.dart';

import '../../../../../shared/next_button.dart';
import 'companyPoliciesRow.dart';

class DownloadContractViewBody extends StatefulWidget {
  const DownloadContractViewBody({super.key});

  @override
  State<DownloadContractViewBody> createState() =>
      _DownloadContractViewBodyState();
}

class _DownloadContractViewBodyState extends State<DownloadContractViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(context) * 0.45,
              child: Text(
                AppConstants.contractText,
                style: MyTextStyles.font14Weight500,
              ),
            ),
            const VerticalSpacer(27),
            buildDownLoadContractButton(context),
            const VerticalSpacer(23),
            const CompanyPoliciesRow(),
            const VerticalSpacer(11),
            const UploadDocsLaterRow(),
            const VerticalSpacer(32),
            NextButton(
              onTap: () {
                context.pushNamed(AppRouter.attachmentsContractView);
              },
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildDownLoadContractButton(BuildContext context) {
    return SizedBox(
      width: getWidth(context) * 0.3,
      child: CustomButton(
        textStyle: MyTextStyles.font12Weight500.copyWith(color: Colors.white),
        text: 'تحميل التعاقد',
        onPressed: () {},
      ),
    );
  }
}
