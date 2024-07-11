import 'package:flutter/material.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  const NextButton({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: getWidth(context)*0.3,
        child: CustomButton(
          borderRadius: BorderRadius.circular(8),
          textStyle: MyTextStyles.font18Weight500
              .copyWith(color: MyColors.kWhiteColor),
          text: 'التالي',
          onPressed: onTap,
        ),
      ),
    );
  }
}