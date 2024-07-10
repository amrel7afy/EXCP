import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:test1/core/widgets/show_alert_dialog.dart';

import '../../../../../../core/constants/methods.dart';
import '../../../../../../core/theming/my_colors.dart';

class WalletBalanceCard extends StatelessWidget {

  const WalletBalanceCard({
    super.key,
  });

  // final TextEditingController walletController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 55.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: getWidth(context) * 0.35,
            child: Text(
              'لديك رصيد محفظة\n60 ريال يمكنك استخدامها',
              style: MyTextStyles.font12Weight500,
            ),
          ),
          const HorizontalSpacer(16),
          Pinput(
            length: 1,
            mainAxisAlignment: MainAxisAlignment.center,
            /*   controller: walletController,
            onChanged: (v) {
              walletController.text = v;
            },*/

            defaultPinTheme: PinTheme(
              width: 50.w,
              height: 32.h,
              textStyle: MyTextStyles.font12Weight500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 66.w,
            child: CustomButton(
              textStyle:
              MyTextStyles.font12Weight500.copyWith(color: Colors.white),
              text: 'استبدال',
              backGroundColor: MyColors.kPrimaryColor,
              onPressed: () {

              },
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}