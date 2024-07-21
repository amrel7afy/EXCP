import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/attachment_contract_view_widgets/skip_upload_docs_later_row.dart';
import 'package:test1/features/shared/next_button.dart';

import '../../../../../../core/AppRouter.dart';
import 'attachment_contract_card.dart';

class AttachmentsContractViewBody extends StatefulWidget {
  const AttachmentsContractViewBody({super.key});

  @override
  State<AttachmentsContractViewBody> createState() =>
      _AttachmentsContractViewBodyState();
}

class _AttachmentsContractViewBodyState
    extends State<AttachmentsContractViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SkipUploadDocsLaterRow(),
            const VerticalSpacer(21),
            ...List.generate(
              4,
              (index) {
                return AttachmentContractCard(onTap: () {});
              },

            ),
            const VerticalSpacer(10),
            NextButton(onTap: (){context.pushNamed(AppRouter.contractSuccessView);})
          ],
        ),
      ),
    );
  }
}
