import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/home/presentation/view/widgets/custom_carousel.dart';
import 'package:test1/features/home/presentation/view/widgets/sevice_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCarousel(),
            const VerticalSpacer(24),
            Text(
              "خدماتنا المميزة",
              style: MyTextStyles.font16Weight600.copyWith(color: Colors.black),
            ),
            Text(
              "مجموعة خدمات لا غنى عنها",
              style: MyTextStyles.font14Weight600.copyWith(color: Colors.black),
            ),
            const VerticalSpacer(17),
            ServiceCard(
              title: 'خدمة بالساعة',
              subTitle: 'خدمات منزلية بنظام الساعات',
              onTap: () {
                AppConstants.service=Service.hours;
                context.pushNamed(AppRouter.servicePerHourView);},
            ),
            const VerticalSpacer(20),
            ServiceCard(
              title: 'خدمة مقيمة',
              subTitle: 'نظام الباقات الشهرية و السنوية',
              onTap: () {
                AppConstants.service=Service.resident;
                context.pushNamed(AppRouter.selectAddressView);
              },
            ),
            const VerticalSpacer(20),
            Align(
              alignment: Alignment.center,
              child: Text(
                "نسعد بتواصلكم معنا من خلال",
                style:
                    MyTextStyles.font16Weight600.copyWith(color: Colors.black),
              ),
            ),
            const VerticalSpacer(23),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: CircleAvatar(
                      radius: 17.5.h,
                      backgroundColor: Colors.grey,
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
