import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/features/login/presentation/view/widgets/text_form_field.dart';

import '../../../../../main.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Logo',
                  style: MyTextStyles.font40Weight700
                      .copyWith(color: Colors.black),
                ),
                const VerticalSpacer(105),
                Text(
                  'تسجيل الدخول',
                  style: MyTextStyles.font24Weight500
                      .copyWith(color: Colors.black),
                ),
                Text(
                  'يرجى إدخال رقم جوالك المسجل لدينا و كلمة المرور',
                  style: MyTextStyles.font12Weight500
                      .copyWith(color: Colors.black),
                ),
                const VerticalSpacer(54),
                const MyTextFormField(
                  labelText: 'رقم الجوال ',
                ),
                const VerticalSpacer(33),
                 MyTextFormField(
                   isObscureText: isObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  labelText: 'كلمة المرور ',
                ),
                const VerticalSpacer(8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: (){},
                    child: Text(
                      'نسيت كلمة المرور',
                      style: MyTextStyles.font14Weight600
                          ,
                    ),
                  ),
                ),
                const VerticalSpacer(12),
                SizedBox(
                  height: 47.h,
                  width: getWidth(context) * 0.5,
                  child: CustomButton(
                    borderRadius: BorderRadius.circular(8),
                    text: 'تسجيل الدخول', textStyle: MyTextStyles.font18Weight600.copyWith(color: Colors.white), backGroundColor: MyColors.kPrimaryColor, onPressed: () {  },
                  ),
                ),
                const VerticalSpacer(12),
                Directionality(
                  textDirection: appTextDirection,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لديك حساب بالفعل ؟',
                        style: MyTextStyles.font14Weight600
                            ,
                      ),
                      const HorizontalSpacer(10),
                      InkWell(onTap: (){},
                      child: Text('إنشاء حساب',style: MyTextStyles.font14Weight600.copyWith(color: MyColors.kGreenColor),),)
                    ],
                  ),
                ),
                Text('تخطي الان',style: MyTextStyles.font14Weight600,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
