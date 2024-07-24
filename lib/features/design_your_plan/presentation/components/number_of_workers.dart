
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../shared/my_text_form_field.dart';

class NumberOfWorkers extends StatelessWidget {
  final TextEditingController numberOfWorkersController = TextEditingController(text: '1');
  NumberOfWorkers({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MyTextFormField(
            labelText: 'عدد العاملات',
            validator: (validator) {},
            controller: numberOfWorkersController,
          ),
        ),
        const HorizontalSpacer(5),
        buildIncreaseButton(),
        const HorizontalSpacer(5),
        buildDecreaseButton()
      ],
    );
  }
  GestureDetector buildIncreaseButton() {
    return GestureDetector(
      onTap: () {
        //numberOfTransactionsController.
      },
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[300],
        ),
        child: const Icon(CupertinoIcons.plus_circle),
      ),
    );
  }

  GestureDetector buildDecreaseButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[300],
        ),
        child: const Icon(
          CupertinoIcons.minus_circle,
          color: MyColors.kPrimaryColor,
        ),
      ),
    );
  }
}
