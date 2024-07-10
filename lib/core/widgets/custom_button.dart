import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? padding;
  final BorderRadius? borderRadius;
  final Color? backGroundColor;
  final TextStyle textStyle;
  final double? buttonWidth;
  final double? buttonHeight;

  const CustomButton(
      {super.key,
      required this.textStyle,
      required this.text,
       this.backGroundColor,
      required this.onPressed,
      this.borderRadius,
      this.buttonWidth,
      this.buttonHeight, this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(padding ?? 3),
        ),
        fixedSize: WidgetStateProperty.all(
            Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: WidgetStateProperty.all<Color>(
          Colors.black,
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backGroundColor??Colors.black,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            side: const BorderSide()
          ),
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.all(padding??3),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
