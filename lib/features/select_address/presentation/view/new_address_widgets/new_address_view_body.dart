import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';

import '../../../../../core/AppRouter.dart';
import '../../../../../core/widgets/custom_button.dart';

class NewAddressBody extends StatefulWidget {
  const NewAddressBody({super.key});

  @override
  State<NewAddressBody> createState() => _NewAddressBodyState();
}

class _NewAddressBodyState extends State<NewAddressBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextFormField(
                  labelText: 'مدينة الإقامة',
                  controller: TextEditingController(),
                  validator: (v) {}),
              MyTextFormField(
                  labelText: 'اسم الحي',
                  controller: TextEditingController(),
                  validator: (v) {}),
              MyTextFormField(
                  labelText: 'نوع المنزل',
                  controller: TextEditingController(),
                  validator: (v) {}),
              MyTextFormField(
                  labelText: 'رقم المنزل',
                  controller: TextEditingController(),
                  validator: (v) {}),
              MyTextFormField(
                maxLines: 6,
                labelText: 'معلم او مكان مميز قريب من عنوانك',
                controller: TextEditingController(),
                validator: (v) {},
              ),
              const VerticalSpacer(16),
              Row(
                children: [
                  Flexible(
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(8),
                      textStyle: MyTextStyles.font18Weight600
                          .copyWith(color: Colors.black),
                      text: 'السابق',
                      backGroundColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close the dialog on button press
                      },
                    ),
                  ),
                  const Spacer(),
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
              )
            ],
          ),
        ));
  }
}
