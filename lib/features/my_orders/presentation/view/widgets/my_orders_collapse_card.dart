import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/order_model.dart';
import 'my_orders_collapse_details.dart';

class MyOrdersCollapseCard extends StatefulWidget {
  final Order order;
  final bool isNew;

  const MyOrdersCollapseCard({super.key, required this.isNew, required this.order});

  @override
  State<MyOrdersCollapseCard> createState() => _MyOrdersCollapseCardState();
}

class _MyOrdersCollapseCardState extends State<MyOrdersCollapseCard> {
  bool isExpanded = false;

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lead-INDY-NO9822',
                        style: MyTextStyles.font14Weight600
                            .copyWith(color: MyColors.kPrimaryColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (widget.isNew) ...[
                    buildNewOrderContainer(),
                  ],
                  const HorizontalSpacer(5),
                  Icon(
                    isExpanded
                        ? CupertinoIcons.minus_circled
                        : CupertinoIcons.add_circled,
                    size: 25,
                  ),
                ],
              ),
            ),
            MyOrdersCollapseDetails(
              isExpanded: isExpanded, order: widget.order,
            ),
          ],
        ),
      ),
    );
  }

  Container buildNewOrderContainer() {
    return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    width: 74.w,
                    height: 27.h,
                    alignment: Alignment.center,
                    child: Text(
                      'جديد',
                      style: MyTextStyles.font12Weight500,
                    ),
                  );
  }
}
