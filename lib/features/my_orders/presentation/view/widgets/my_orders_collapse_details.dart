import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/order_model.dart';

class MyOrdersCollapseDetails extends StatelessWidget {
  final Order order;
  final bool isExpanded;
  const MyOrdersCollapseDetails({
    super.key, required this.isExpanded, required this.order,
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
                  'صاحب الطلب: ${order.orderName} ',
                  style: MyTextStyles.font14Weight500.copyWith(
                    color: MyColors.kPrimaryColor,
                    height: 2,
                  ),
                ),
                Text(
                  'تاريخ الطلب : ${order.orderDate} ',
                  style: MyTextStyles.font14Weight500.copyWith(
                    color: MyColors.kPrimaryColor,
                    height: 2,
                  ),
                ),

                if(isExpanded)
                   MyOrderExpandedContent(order: order,)
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
  final Order order;
  const MyOrderExpandedContent({
    super.key, required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
     Text(
       'الجنسية : ${order.orderNationality} ',
       style: MyTextStyles.font14Weight500.copyWith(
         color: MyColors.kPrimaryColor,
         height: 2,
       ),
     ),
     Text(
     'المهنة المطلوبة : ${order.orderJob} ',
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
       order.orderDetails,
       style: MyTextStyles.font14Weight500.copyWith(
         color: MyColors.kPrimaryColor,
         height: 1.5,
       ),
     ),
     const VerticalSpacer(10),],
                   );
  }
}
