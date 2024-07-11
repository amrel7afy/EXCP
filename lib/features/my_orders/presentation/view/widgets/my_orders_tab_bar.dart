import 'package:flutter/material.dart';
import '../../../../../core/theming/my_colors.dart';

class MyOrdersTabBar extends StatelessWidget {
  const MyOrdersTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,

      dividerHeight: 0,
      tabs: const [
        Tab(
          child: Text('الأفراد'),
        ),
        Tab(text: 'الساعات'),
        Tab(text: 'الأعمال'),
      ],
      indicatorColor: MyColors.kPrimaryColor,
      labelColor: MyColors.kPrimaryColor,
      unselectedLabelColor: Colors.white,
    );
  }
}