import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';

import '../../../../../../core/AppRouter.dart';
import '../../../../../../core/constants/methods.dart';
import '../../../../../../core/theming/my_colors.dart';

class ContractSuccessAlertDialogContent extends StatelessWidget {
  const ContractSuccessAlertDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: Column(

        children: [
          const Icon(
            CupertinoIcons.check_mark_circled,
            color: MyColors.kPrimaryColor,
            size: 100,
          ),
          const VerticalSpacer(19),
          Text(
            'تم تسجيل التعاقد بنجاح',
            style: MyTextStyles.font20Weight700
                .copyWith(color: MyColors.kPrimaryColor),
          ),
          const VerticalSpacer(30),
          SizedBox(
            width: 193.w,
            child: CustomButton(
              textStyle: MyTextStyles.font18Weight600.copyWith(color: Colors.white),
              text: 'طلباتي',
              onPressed: () {
                context.pushNamed(AppRouter.myOrdersView);
              },
            ),
          ),
          const VerticalSpacer(17),
          SizedBox(
            width: 193.w,

            child: CustomButton(
              textStyle: MyTextStyles.font18Weight600.copyWith(color: Colors.white),
              text: 'الرئيسية',
              onPressed: () {
                context.pushNamedAndRemoveUntil(AppRouter.homeView , predicate: (Route<dynamic> route) => false,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
