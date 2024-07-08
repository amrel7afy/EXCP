import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/core/widgets/drop_down_floating_label_form_field.dart';
import 'package:test1/core/widgets/select_date.dart';
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';

import '../../../../../core/theming/my_colors.dart';
import 'appointment_details.dart';

class DesignYourOfferViewBody extends StatefulWidget {
  const DesignYourOfferViewBody({super.key});

  @override
  State<DesignYourOfferViewBody> createState() =>
      _DesignYourOfferViewBodyState();
}

class _DesignYourOfferViewBodyState extends State<DesignYourOfferViewBody> {
  List<String> nationality = ['المجر', 'الفلبين'];
  List<String> contractDuration = ['3 شهور', '5 شهور'];
  List<String> duration = ['صباحي', 'مسائي'];
  List<String> intervals = ['من 8ص الي 10ص', 'من 10ص الي 12ص'];
  List<String> numberOfVisits = ['1', '2', '3', '4', '5'];
  TextEditingController numberOfTransactionsController =
      TextEditingController(text: '1');
  TextEditingController dateOfFirstVisitController =
      TextEditingController(text: 'اختر');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyDropdownFormField(
                labelText: 'الجنسية',
                items: nationality,
                value: nationality.first,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: MyTextFormField(
                    labelText: 'عدد العاملات',
                    validator: (validator) {},
                    controller: numberOfTransactionsController,
                  ),
                ),
                const HorizontalSpacer(5),
                buildIncreaseButton(),
                const HorizontalSpacer(5),
                buildDecreaseButton()
              ],
            ),
            MyDropdownFormField(
                labelText: 'مدة التعاقد',
                items: contractDuration,
                value: contractDuration.first,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            MyDropdownFormField(
                labelText: 'الفترات',
                items: duration,
                value: duration.first,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            const AppointmentDetails(),
            const VerticalSpacer(15),
            MyDropdownFormField(
              labelText: 'توقيت الزيارة',
              items: intervals,
              value: intervals.first,
              onChanged: (newVal) {},
              itemBuilder: (item) {
                return Text(item);
              },
              validator: (validator) {},
            ),
            MyDropdownFormField(
              labelText: 'عدد الزيارات',
              items: numberOfVisits,
              onChanged: (newVal) {},
              value: numberOfVisits.first,
              itemBuilder: (item) {
                return Text(item);
              },
              validator: (validator) {},
            ),
            MyTextFormField(
              labelText: 'تاريخ اول زيارة',
              controller: dateOfFirstVisitController,
              validator: (validator) {},
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_outlined,
                    size: 20, color: MyColors.kPrimaryColor),
                onPressed: () async{

                  dateOfFirstVisitController.text= await selectDate(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomButton(
                buttonWidth: getWidth(context) * 0.3,
                borderRadius: BorderRadius.circular(8),
                textStyle:
                    MyTextStyles.font18Weight600.copyWith(color: Colors.white),
                text: 'التالي',
                backGroundColor: Colors.black,
                onPressed: ()  {

                },
              ),
            ),
          ],
        ),
      ),
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
