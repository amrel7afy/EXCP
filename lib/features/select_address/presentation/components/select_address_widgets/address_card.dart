import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';

class AddressCard extends StatefulWidget {
  final String text;
  final bool isChecked;
  final VoidCallback onTap;
  final TextStyle? titleTextStyle;
  final String? subTitle;

  const AddressCard(
      {super.key,
      required this.text,
      required this.isChecked,
      required this.onTap, this.titleTextStyle, this.subTitle});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
        margin: EdgeInsets.symmetric(vertical: 6.h),
        width: getWidth(context),

        decoration: BoxDecoration(
            color: widget.isChecked
                ? MyColors.kAppBarBackGroundColor
                : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: widget.isChecked
                ? MyColors.kPrimaryColor
                : Colors.grey)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: widget.subTitle==null?getWidth(context) * 0.65:getWidth(context) * 0.3,
                  child: AutoSizeText(
                    widget.text,
                    style:widget.titleTextStyle?? MyTextStyles.font16Weight500.copyWith(
                      color: MyColors.kPrimaryColor,
                    ),
                    maxLines: 2,
                  ),
                ),
                if(widget.subTitle!=null)
                  ...[
                    const VerticalSpacer(7),
                    Text(widget.subTitle!,style: MyTextStyles.font12Weight500,)]
              ],
            ),
            const Spacer(),
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      widget.isChecked ? MyColors.kPrimaryColor : Colors.grey,
                  width: 2.0,
                ),
              ),
              child: widget.isChecked
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 16.0,
                        color: MyColors.kPrimaryColor,
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}