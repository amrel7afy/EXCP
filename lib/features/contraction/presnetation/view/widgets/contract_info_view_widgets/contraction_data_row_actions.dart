import 'package:flutter/material.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/core/widgets/show_alert_dialog.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_info_view_widgets/show_visit_dialog_content.dart';

class ContractionDataRowActions extends StatelessWidget {
  const ContractionDataRowActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CustomButton(
            borderRadius: BorderRadius.circular(8),
            textStyle:
            MyTextStyles.font18Weight500.copyWith(color: Colors.black),
            text: 'عرض الزيارات',
            backGroundColor: Colors.white,
            onPressed: () {
              showAlertDialog(context, const ShowVisitsDialogContent());
            },
          ),
        ),
        const HorizontalSpacer(40),
        // Add some space between buttons
        Flexible(
          child: CustomButton(
            borderRadius: BorderRadius.circular(8),
            textStyle:
            MyTextStyles.font18Weight500.copyWith(color: Colors.white),
            text: 'إتمام التعاقد',
            backGroundColor: Colors.black,
            onPressed: () {
              context.pushNamed(AppRouter.contractSuccessView);
            },
          ),
        ),
      ],
    );
  }
}