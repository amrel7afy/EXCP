import 'package:flutter/material.dart';
import 'package:test1/features/home/presentation/view/widgets/home_view_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'مرحباً بك عميلنا العزيز',
          leading: true,
          leadingPressed: () {},
        ),
        body: const SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
