import 'package:flutter/material.dart';
import 'package:test1/features/login/presentation/view/widgets/login_view_body.dart';
import 'package:test1/features/sign_up/presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SignUpViewBody()),
    );
  }
}
