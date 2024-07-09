import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';

class TypesOfOrders extends StatefulWidget {
  const TypesOfOrders({
    super.key,
  });

  @override
  State<TypesOfOrders> createState() => _TypesOfOrdersState();
}

class _TypesOfOrdersState extends State<TypesOfOrders> {
  final List<String> typesOfOrders = [
    'الأفراد',
    'الساعات',
    'الأعمال',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(typesOfOrders.length, (int index) {
          return DayCard(
            weekDay: typesOfOrders[index],
            selected: currentIndex == index,
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
          );
        }));
  }
}

class DayCard extends StatelessWidget {
  final VoidCallback onTap;
  final bool selected;

  const DayCard({
    super.key,
    required this.weekDay,
    required this.onTap,
    required this.selected,
  });

  final String weekDay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 4, left: 3),
          width: 106.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selected ? MyColors.kPrimaryColor : Colors.grey,
          ),
          child: Center(
              child: Text(
                weekDay,
                style: MyTextStyles.font12Weight500.copyWith(
                    color: selected ? MyColors.kPinkColor : MyColors.kPrimaryColor),
              ))),
    );
  }
}