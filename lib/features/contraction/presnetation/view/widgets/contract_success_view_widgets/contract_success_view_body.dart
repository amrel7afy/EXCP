import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/core/widgets/show_alert_dialog.dart';
import 'package:test1/features/contraction/presnetation/view/widgets/contract_success_view_widgets/wallet_balance.dart';

import '../../../../../../core/theming/my_colors.dart';
import 'contract_success_alert_dialog_content.dart';

class ContractSuccessViewBody extends StatefulWidget {
  const ContractSuccessViewBody({super.key});

  @override
  State<ContractSuccessViewBody> createState() =>
      _ContractSuccessViewBodyState();
}

class _ContractSuccessViewBodyState extends State<ContractSuccessViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.check_mark_circled,
                color: MyColors.kPrimaryColor,
                size: 150,
              ),
              Text(
                'تم تسجيل التعاقد بنجاح',
                style: MyTextStyles.font20Weight700
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
              const VerticalSpacer(13),
              Text(
                "رقم العقد 8258745HIJH",
                style: MyTextStyles.font16Weight600
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
              const VerticalSpacer(15),
              Text(
                ' قيمة العقد ‏9,800.00 ريال',
                style: MyTextStyles.font20Weight700
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
              const VerticalSpacer(16),
              const WalletBalanceCard(),
              const VerticalSpacer(37),
              SizedBox(
                child: CustomButton(
                  textStyle: MyTextStyles.font18Weight500
                      .copyWith(color: Colors.white),
                  text: 'ادفع ‏9,800.00 لتفعيل التعاقد',
                  backGroundColor: MyColors.kPrimaryColor,
                  onPressed: () {
                    showAlertDialog(
                      context,
                      const ContractSuccessAlertDialogContent(),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const VerticalSpacer(16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'ملاحظة: لديك ساعة واحدة فقط للدفع\n',
                      style: MyTextStyles.font16Weight700.copyWith(
                        color: MyColors.kGreenColor,
                      ),
                    ),
                    TextSpan(
                        text: 'عملية إلغاء العقد تتم بشكل تلقائي,',
                        style: MyTextStyles.font16Weight700
                            .copyWith(color: MyColors.kPrimaryColor))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


