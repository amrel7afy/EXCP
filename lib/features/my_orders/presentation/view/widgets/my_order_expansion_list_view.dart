import 'package:flutter/material.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/features/my_orders/presentation/view/widgets/my_orders_collapse_card.dart';


class MyOrdersExpansionListView extends StatelessWidget {
  const MyOrdersExpansionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(AppConstants.k21ViewPadding, 0,
              AppConstants.k21ViewPadding, 17.0),
          child:  MyOrdersCollapseCard(isNew: index==0?true:false,),
        );
      }, childCount: 4),
    );
  }
}
