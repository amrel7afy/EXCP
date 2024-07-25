import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';

class EmptyAddressBody extends StatefulWidget {
  const EmptyAddressBody({super.key});

  @override
  State<EmptyAddressBody> createState() => _EmptyAddressBodyState();
}

class _EmptyAddressBodyState extends State<EmptyAddressBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.5.h,
                  backgroundColor: Colors.grey[300],
                ),
                Text(
                  "لا توجد عناوين سابقة لديك",
                  style: MyTextStyles.font20Weight500
                      .copyWith(color: Colors.black),
                ),
                const VerticalSpacer(24),
                SizedBox(
                  width: getWidth(context) * 0.8,
                  child: CustomButton(
                    borderRadius: BorderRadius.circular(AppConstants.k8Radius),
                      textStyle: MyTextStyles.font18Weight500
                          .copyWith(color: Colors.white),
                      text: 'إضافة عنوان جديد',
                      backGroundColor: MyColors.kPrimaryColor,
                      onPressed: () {
                      context.pushNamed(AppRouter.newAddressView);
                      }),
                ),
                const VerticalSpacer(20),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
