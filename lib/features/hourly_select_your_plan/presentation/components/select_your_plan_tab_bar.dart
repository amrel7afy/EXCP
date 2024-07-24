import 'package:flutter/material.dart';
import '../../../../../core/theming/my_colors.dart';

class SelectYourPlanTabBar extends StatelessWidget {
  const SelectYourPlanTabBar({
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
          child: Text('صباحي'),
        ),
        Tab(text: 'مسائي'),
      ],
      indicatorColor: MyColors.kPrimaryColor,
      labelColor: MyColors.kPrimaryColor,
      unselectedLabelColor: Colors.grey,
    );
  }
}
