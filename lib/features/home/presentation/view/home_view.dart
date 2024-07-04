import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:test1/main.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(title: 'مرحباً بك عميلنا العزيز',),
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
