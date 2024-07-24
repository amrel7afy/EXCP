import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/theming/styles.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 59.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey[100],
      ),
      child: Row(
        children: [
          Text(
            'مواعيد التوصيل',
            style: MyTextStyles.font12Weight500
                .copyWith(color: Colors.grey),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الفترة الصباحية : من 8 ص الى 5 م',
                style: MyTextStyles.font12Weight500
                    .copyWith(color: Colors.grey),
              ),
              Text(
                'الفترة المسائية : من 5 م الى 9 م',
                style: MyTextStyles.font12Weight500
                    .copyWith(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}