import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/main.dart';


class ServiceAlertDialogContent extends StatelessWidget {
  const ServiceAlertDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacer(18),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
        ),
        const VerticalSpacer(10),
        Text(
          'هذه الخدمة تقدم للعائلات فقط',
          style:
          MyTextStyles.font18Weight700.copyWith(color: Colors.black),
        ),
        const VerticalSpacer(12),
        Text(
          'نعتذر على عدم تقديم الخدمة في حالة عدم وجود سيدة بالمنزل',
          style:
          MyTextStyles.font14Weight500.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const VerticalSpacer(12),
        SizedBox(
          width: getWidth(context),
          height: 47,
          child: Row(
            children: [
              Flexible(
                child: CustomButton(
                  borderRadius: BorderRadius.circular(8),
                  textStyle: MyTextStyles.font18Weight600
                      .copyWith(color: Colors.black),
                  text: 'رجوع',
                  backGroundColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Close the dialog on button press
                  },
                ),
              ),
              const HorizontalSpacer(10),
              // Add some space between buttons
              Flexible(
                child: CustomButton(
                  borderRadius: BorderRadius.circular(8),
                  textStyle: MyTextStyles.font18Weight600
                      .copyWith(color: Colors.white),
                  text: 'التالي',
                  backGroundColor: Colors.black,
                  onPressed: () {
                    context.pushReplacementNamed(AppRouter.selectAddressView);
                  },
                ),
              ),
            ],
          ),
        ),
        const VerticalSpacer(16),
      ],
    );
  }
}