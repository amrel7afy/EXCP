import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';

class MyOrdersCollapseDetails extends StatelessWidget {
  final bool isExpanded;
  const MyOrdersCollapseDetails({
    super.key, required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: MyColors.kAppBarBackGroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            thickness: 1,
            height: 0,
            color: MyColors.kPrimaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(11),

                Text(
                  'صاحب الطلب: Ahmed Abo Alfadl ',
                  style: MyTextStyles.font14Weight500.copyWith(
                    color: MyColors.kPrimaryColor,
                    height: 2,
                  ),
                ),
                Text(
                  'تاريخ الطلب : 20/05/2021 ',
                  style: MyTextStyles.font14Weight500.copyWith(
                    color: MyColors.kPrimaryColor,
                    height: 2,
                  ),
                ),

                if(isExpanded)
                  const MyOrderExpandedContent()
              ],
            ),
          ),
          const VerticalSpacer(20)
        ],
      ),
    );
  }
}

class MyOrderExpandedContent extends StatelessWidget {
  const MyOrderExpandedContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
     Text(
       'الجنسية : بنجلاديش ',
       style: MyTextStyles.font14Weight500.copyWith(
         color: MyColors.kPrimaryColor,
         height: 2,
       ),
     ),
     Text(
     'المهنة المطلوبة : عاملة منزلية ',
     style: MyTextStyles.font14Weight500.copyWith(
       color: MyColors.kPrimaryColor,
       height: 2,
     ),
                     ),
     const VerticalSpacer(8),
     Text(
       'تفاصيل الطلب:',
       style: MyTextStyles.font12Weight500.copyWith(
         color: MyColors.kPrimaryColor,
         height: 2,
       ),
     ),
     Text(
       'طلب اختيار افراد من التطبيق',
       style: MyTextStyles.font14Weight500.copyWith(
         color: MyColors.kPrimaryColor,
         height: 1.5,
       ),
     ),
     const VerticalSpacer(10),],
                   );
  }
}
