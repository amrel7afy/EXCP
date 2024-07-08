import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/core/widgets/select_date.dart';
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';
import 'package:test1/features/select_your_plan/presentation/view/widgets/collapse_card.dart';

import '../../../../../../core/theming/my_colors.dart';

class ContractInfoViewBody extends StatefulWidget {
  const ContractInfoViewBody({super.key});

  @override
  State<ContractInfoViewBody> createState() => _ContractInfoViewBodyState();
}

class _ContractInfoViewBodyState extends State<ContractInfoViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CobunTextFormField(),
            const VerticalSpacer(20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.2),
                      borderRadius: BorderRadius.circular(10)),
                  width: getWidth(context),
                  child: const FavoriteDays(),
                ),
                Positioned(
                  top: -10,
                  right: 10,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    width: 120.w,
                    child: Text(
                      'الأيام المفضلة',
                      style: MyTextStyles.font14Weight500,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacer(23),
            const CollapseCard(
              showVisitPrice: true,
            ),
            const VerticalSpacer(16),
            Text(
              'بإكمالك الخطوات فأنت توافق على',
              style: MyTextStyles.font14Weight500,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                ' شروط و أحكام الشركة',
                style: MyTextStyles.font14Weight500
                    .copyWith(color: MyColors.kGreenColor),
              ),
            ),
            const VerticalSpacer(37),
            Row(
              children: [
                Flexible(
                  child: CustomButton(
                    borderRadius: BorderRadius.circular(8),
                    textStyle: MyTextStyles.font18Weight500
                        .copyWith(color: Colors.black),
                    text: 'عرض الزيارات',
                    backGroundColor: Colors.white,
                    onPressed: () {

                    },
                  ),
                ),
                const HorizontalSpacer(40),
                // Add some space between buttons
                Flexible(
                  child: CustomButton(
                    borderRadius: BorderRadius.circular(8),
                    textStyle: MyTextStyles.font18Weight500
                        .copyWith(color: Colors.white),
                    text: 'إتمام التعاقد',
                    backGroundColor: Colors.black,
                    onPressed: () {

                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteDays extends StatefulWidget {
  const FavoriteDays({
    super.key,
  });

  @override
  State<FavoriteDays> createState() => _FavoriteDaysState();
}

class _FavoriteDaysState extends State<FavoriteDays> {
  final List<String> weekDays = [
    'السبت',
    'الاحد',
    'الاثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس'
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(weekDays.length, (int index) {
      return DayCard(
        weekDay: weekDays[index],
        selected: currentIndex == index,
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
      );
    }));
  }
}

class DayCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool selected;

  const DayCard({
    super.key,
    required this.weekDay,
    required this.onTap,
    required this.selected,
  });

  final String weekDay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 4, left: 3),
          width: 117.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selected ? MyColors.kPrimaryColor : Colors.grey,
          ),
          child: Center(
              child: Text(
            weekDay,
            style: MyTextStyles.font12Weight500.copyWith(
                color: selected ? MyColors.kPinkColor : MyColors.kPrimaryColor),
          ))),
    );
  }
}

class CobunTextFormField extends StatelessWidget {
  const CobunTextFormField({
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
