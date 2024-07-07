import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_states.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/features/login/presentation/view/login_view.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../main.dart';

class SignUpButtonAndHaveAccountText extends StatelessWidget {
  const SignUpButtonAndHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthCreateUserSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('تم إنشاء الحساب')));
            }else if (state is AuthUserIsExists) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('الحساب موجود بالفعل')));
            }
          },
          child: SizedBox(
            height: 47.h,
            width: getWidth(context) * 0.5,
            child: CustomButton(
              borderRadius: BorderRadius.circular(8),
              text: 'إنشاء حساب',
              textStyle:
                  MyTextStyles.font18Weight600.copyWith(color: Colors.white),
              backGroundColor: MyColors.kPrimaryColor,
              onPressed: () {
                if(context.read<AuthCubit>().signUpFormKey.currentState!.validate()){
                  context.read<AuthCubit>().signUp();
                }
              },
            ),
          ),
        ),
        const VerticalSpacer(12),
        Directionality(
          textDirection: AppConstants.appTextDirection,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لديك حساب بالفعل ؟',
                style: MyTextStyles.font14Weight600,
              ),
              const HorizontalSpacer(10),
              InkWell(
                onTap: () {
              context.pushReplacementNamed(AppRouter.loginView);
                },
                child: Text(
                  'تسجيل الدخول',
                  style: MyTextStyles.font14Weight600
                      .copyWith(color: MyColors.kGreenColor),
                ),
              )
            ],
          ),
        ),
        const VerticalSpacer(24),
      ],
    );
  }
}
