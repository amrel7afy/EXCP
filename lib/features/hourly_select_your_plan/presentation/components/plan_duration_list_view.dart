import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/features/hourly_select_your_plan/presentation/components/my_choice_chip.dart';


class PlanDurationChipsListView extends StatefulWidget {

  const PlanDurationChipsListView({super.key});

  @override
  State<PlanDurationChipsListView> createState() =>
      _PlanDurationChipsListViewState();
}

class _PlanDurationChipsListViewState extends State<PlanDurationChipsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin:  EdgeInsets.only(left: 5.w,right: index==0?AppConstants.k30ViewPadding:0),
            width: 71.w,
            child: MyChoiceChip(onTap: (){
              setState(() {
                currentIndex=index;
              });

            }, toggle: currentIndex==index, text: '8 شهور'),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
