
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';
import 'select_your_plan_expanded_content.dart';

class CollapseCard extends StatefulWidget {
  final VoidCallback onExpandedTap;
  final bool showVisitPrice;
  const CollapseCard({super.key, required this.showVisitPrice, required this.onExpandedTap});

  @override
  State<CollapseCard> createState() => _CollapseCardState();
}

class _CollapseCardState extends State<CollapseCard> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
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
                            'باقة زيارة واحدة أسبوعيا لمدة 3 شهور',
                            style: MyTextStyles.font14Weight600
                                .copyWith(color: MyColors.kPrimaryColor),
                          ),
                          if(widget.showVisitPrice)
                            const VisitPrice(),
                          RichText(
                            text: TextSpan(
                              text: '9,800.00 ريال    ',
                              style: MyTextStyles.font12Weight500,
                              children: [
                                TextSpan(
                                  text: '12,800.00',
                                  style: MyTextStyles.font12Weight500.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        _isExpanded
                            ? CupertinoIcons.minus_circled
                            : CupertinoIcons.add_circled,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                if (_isExpanded)  ExpandedContent(onTap: widget.onExpandedTap,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VisitPrice extends StatelessWidget {
  const VisitPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
          horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
      child:  Text('سعر الزيارة 240.00 ر .س',style: MyTextStyles.font12Weight500,),
    );
  }
}
