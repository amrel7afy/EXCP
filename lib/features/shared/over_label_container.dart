import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/theming/styles.dart';

import '../../../../../../core/theming/my_colors.dart';

class OverLabelContainer extends StatelessWidget {
  final String label;
  final Widget body;

  const OverLabelContainer({
    super.key,
    required this.label,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(width: 1.2),
              borderRadius: BorderRadius.circular(10)),
          width: getWidth(context),
          child: body,
        ),
        Positioned(
          top: -10,
          right: 10,
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(
              label,
              style: MyTextStyles.font14Weight500,
            ),
          ),
        ),
      ],
    );
  }
}