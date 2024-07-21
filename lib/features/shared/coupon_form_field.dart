import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';

import '../../core/theming/my_colors.dart';
import 'my_text_form_field.dart';

class CouponTextFormField extends StatelessWidget {
  const CouponTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      labelText: 'هل تمتلك كوبون خصم؟',
      controller: TextEditingController(),
      hint: 'ادخل رقم الكوبون من فضلك',
      hintStyle:
      MyTextStyles.font12Weight500.copyWith(color: MyColors.kPrimaryColor),
      validator: (validator) {},
      suffixIcon: Container(
        height: 40.h,
        margin: const EdgeInsets.all(10),
        width: 92.w,
        child: CustomButton(
            borderRadius: BorderRadius.circular(10),
            textStyle:
            MyTextStyles.font12Weight500.copyWith(color: Colors.white),
            text: 'تطبيق الخصم',
            backGroundColor: MyColors.kPrimaryColor,
            onPressed: () {}),
      ),
    );
  }
}
