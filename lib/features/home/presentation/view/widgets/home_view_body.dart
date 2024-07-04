import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
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
            const ServiceCard(title: 'خدمة بالساعة', subTitle: 'خدمات منزلية بنظام الساعات'),
            const VerticalSpacer(20),
            const ServiceCard(title: 'خدمة مقيمة', subTitle: 'نظام الباقات الشهرية و السنوية'),
            const VerticalSpacer(20),
            Align(
              alignment: Alignment.center,
              child: Text(
                "نسعد بتواصلكم معنا من خلال",
                style: MyTextStyles.font16Weight600.copyWith(color: Colors.black),
              ),
            ),
            const VerticalSpacer(23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:List.generate(6, (index){return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CircleAvatar(
                  radius: 17.5.h,
                  backgroundColor: Colors.grey,
                ),
              );})
            )
          ],
        ),
      ),
    );
  }
}

