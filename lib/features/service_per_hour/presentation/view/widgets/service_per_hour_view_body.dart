import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/home/presentation/view/widgets/custom_carousel.dart';
import 'package:test1/features/home/presentation/view/widgets/sevice_card.dart';

class ServicePerHourBody extends StatefulWidget {
  const ServicePerHourBody({super.key});

  @override
  State<ServicePerHourBody> createState() => _ServicePerHourBodyState();
}

class _ServicePerHourBodyState extends State<ServicePerHourBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "اختر الخدمة المطلوبة",
              style: MyTextStyles.font18Weight600.copyWith(color: Colors.black),
            ),

            const VerticalSpacer(17),
             ServiceCard(title: 'عاملة تنظيف', subTitle: 'تقدم الخدمة بعقود شهرية من شهر الي 24 شهر', onTap: () {  },),
            const VerticalSpacer(20),
             ServiceCard(title: 'عاملة تنظيف بالمواد المطلوبة', subTitle: 'تقدم الخدمة بعقود شهرية من شهر الي 24 شهر', onTap: () {  },),
            const VerticalSpacer(20),

          ],
        ),
      ),
    );
  }
}

