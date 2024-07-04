import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:test1/main.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title: const Text('مرحباً بك عميلنا العزيز'),
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {  },),
     actions:  [IconButton(icon:  const Icon(Icons.notifications), onPressed: () {  })],
        ),
        body: const SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
