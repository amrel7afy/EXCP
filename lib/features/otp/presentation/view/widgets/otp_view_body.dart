import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';

class OTPVerifyViewBody extends StatefulWidget {
  const OTPVerifyViewBody({super.key});

  @override
  State<OTPVerifyViewBody> createState() => _OTPVerifyViewBodyState();
}

class _OTPVerifyViewBodyState extends State<OTPVerifyViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23),
      child: Column(
        children: [
          Pinput(
            onTap: () {},
            controller: TextEditingController(),
            length: 6,
            onCompleted: (val) {},
          ),
          const VerticalSpacer(30),
          CustomButton(
            width: getWidth(context)*0.4,
            borderRadius: BorderRadius.circular(8),
            textStyle: MyTextStyles.font18Weight500.copyWith(color: Colors.white),
            text: 'تأكيد',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
