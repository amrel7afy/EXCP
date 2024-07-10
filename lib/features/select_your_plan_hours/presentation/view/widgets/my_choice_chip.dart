import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'choice_chips_list_view.dart';

class MyChoiceChip extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool toggle;
  final double? verticalPadding;

  const MyChoiceChip({
    super.key,
    required this.onTap,
    required this.toggle,
    required this.text, this.verticalPadding,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical:verticalPadding?? 12.h,horizontal: 5),
        decoration: BoxDecoration(
          color: toggle ? MyColors.kPrimaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: MyTextStyles.font12Weight500.copyWith(
              color: toggle ? MyColors.kPinkColor : MyColors.kPrimaryColor),
        ),
      ),
    );
  }
}