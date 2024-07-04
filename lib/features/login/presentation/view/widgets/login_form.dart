import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/shared/cubits/auth_cubit/auth_cubit.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/login/presentation/view/widgets/my_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().loginFormKey,
      child: Column(
        children: [
          MyTextFormField(
              labelText: 'رقم الجوال ',
              controller: context.read<AuthCubit>().phoneNumberController,
              validator: context.read<AuthCubit>().phoneValidator),
          const VerticalSpacer(18),
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
            validator: context.read<AuthCubit>().passwordValidator,
            controller: context.read<AuthCubit>().passwordController,
          ),
          const VerticalSpacer(8),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {},
              child: Text(
                'نسيت كلمة المرور',
                style: MyTextStyles.font14Weight600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
