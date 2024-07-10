import 'package:flutter/material.dart';
import 'package:test1/core/constants/constants.dart';
import 'collapse_card.dart';

class ExpansionListView extends StatelessWidget {
  const ExpansionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(AppConstants.k21ViewPadding, 0,
              AppConstants.k21ViewPadding, 17.0),
          child:  CollapseCard(showVisitPrice: false, onExpandedTap: () {  },),
        );
      }, childCount: 4),
    );
  }
}
