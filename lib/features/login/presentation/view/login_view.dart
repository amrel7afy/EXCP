import 'package:flutter/material.dart';
import 'package:test1/features/login/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginViewBody()),
    );
  }
}