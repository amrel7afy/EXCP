import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';
import 'my_orders_collapse_details.dart';

class MyOrdersCollapseCard extends StatefulWidget {
  final bool isNew;
  const MyOrdersCollapseCard({super.key, required this.isNew});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lead-INDV-NO9822',
                        style: MyTextStyles.font14Weight600
                            .copyWith(color: MyColors.kPrimaryColor),
                      ),

                    ],
                  ),
                  Icon(
                    isExpanded
                        ? CupertinoIcons.minus_circled
                        : CupertinoIcons.add_circled,
                    size: 25,
                  ),
                ],
              ),
            ),

              MyOrdersCollapseDetails(isExpanded:isExpanded ,),
          ],
        ),
      ),
    );
  }
}


