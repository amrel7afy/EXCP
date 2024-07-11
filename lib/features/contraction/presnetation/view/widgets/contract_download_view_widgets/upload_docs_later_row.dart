import 'package:flutter/material.dart';
 import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';

class UploadDocsLaterRow extends StatelessWidget {
  const UploadDocsLaterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.emoji_objects,
          color: MyColors.kPrimaryColor,
        ),
        HorizontalSpacer(11),

        Text(
          'يتوجب عليك رفع المستندات المطلوبة لاحقا',
          style: MyTextStyles.font12Weight500
              .copyWith(color: MyColors.kGreenColor),
        ),
      ],
    );
  }
}