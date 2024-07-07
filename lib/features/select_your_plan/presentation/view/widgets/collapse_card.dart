import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/theming/styles.dart';
import 'expanded_content.dart';

class CollapseCard extends StatefulWidget {
  const CollapseCard({super.key});

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
    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppConstants.k21ViewPadding),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
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
                  Icon(_isExpanded?CupertinoIcons.minus_circled:CupertinoIcons.add_circled,size: 25,),
                ],
              ),
            ),
            if (_isExpanded) const ExpandedContent(),
          ],
        ),
      ),
    );
  }
}
