import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/select_your_plan/presentation/view/widgets/plan_duration_list_view.dart';
import 'collapse_card.dart';
import 'my_choice_chip.dart';
import 'choice_chips_list_view.dart';
class ExpansionListView extends StatelessWidget {
  const ExpansionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 17.0),
            child: CollapseCard(),
          );
        },
        childCount: 4
    ),);
  }
}