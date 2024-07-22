import 'package:flutter/material.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';

class MyBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const MyBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: getWidth(context) * 0.3,
        child: CustomButton(
          backGroundColor: Colors.white,
          borderRadius: BorderRadius.circular(8),
          textStyle: MyTextStyles.font18Weight500,
          text: 'السابق',
          onPressed: onTap,
        ),
      ),
    );
  }
}
