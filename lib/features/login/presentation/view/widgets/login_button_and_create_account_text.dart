import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';

import '../../../../../main.dart';
import '../../../../sign_up/presentation/view/sign_up_view.dart';
class LoginButtonAndCreateAccountText extends StatelessWidget {
  const LoginButtonAndCreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

      SizedBox(
      height: 47.h,
      width: getWidth(context) * 0.5,
      child: CustomButton(
        borderRadius: BorderRadius.circular(8),
        text: 'تسجيل الدخول',
        textStyle: MyTextStyles.font18Weight600.copyWith(color: Colors.white),
        backGroundColor: MyColors.kPrimaryColor,
        onPressed: () {},
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
    InkWell(onTap: (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SignUpView()));
    },
    child: Text('إنشاء حساب',style: MyTextStyles.font14Weight600.copyWith(color: MyColors.kGreenColor),),)
    ],
    ),
    ),
        const VerticalSpacer(24),],
    );
  }
}
