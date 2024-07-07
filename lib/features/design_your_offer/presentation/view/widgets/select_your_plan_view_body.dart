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
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';

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
  List<String> numberOfVisits = ['1', '2','3','4','5'];
  TextEditingController numberOfTransactionsController =
      TextEditingController(text: '1');

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
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: MyTextFormField(
                    labelText: 'عدد العاملات',
                    validator: (validator) {},
                    controller: numberOfTransactionsController,
                  ),
                ),
                HorizontalSpacer(5),
                buildIncreaseButton(),
                HorizontalSpacer(5),
                buildDecreaseButton()
              ],
            ),
            MyDropdownFormField(
                labelText: 'مدة التعاقد',
                items: contractDuration,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            MyDropdownFormField(
                labelText: 'الفترات',
                items: duration,
                onChanged: (newVal) {},
                itemBuilder: (item) {
                  return Text(item);
                },
                validator: (validator) {}),
            Container(
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
            ),
            const VerticalSpacer(15),
            MyDropdownFormField(
              labelText: 'توقيت الزيارة',
              items: intervals,
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
              itemBuilder: (item) {
                return Text(item);
              },
              validator: (validator) {},
            ),
            MyDropdownFormField(
              labelText: 'تاريخ اول زيارة',
              items: numberOfVisits,
              onChanged: (newVal) {},
              itemBuilder: (item) {
                return Text(item);
              },
              validator: (validator) {},
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: CustomButton(
                  buttonWidth:getWidth(context)*0.3,
                borderRadius: BorderRadius.circular(8),
                textStyle: MyTextStyles.font18Weight600
                    .copyWith(color: Colors.white),
                text: 'التالي',
                backGroundColor: Colors.black,
                onPressed: () {
                 // context.pushReplacementNamed(AppRouter.selectAddressView);
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
        height: 46.h,
        width: 46.w,
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
        height: 46.h,
        width: 46.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[300],
        ),
        child: const Icon(CupertinoIcons.minus_circle),
      ),
    );
  }
}
