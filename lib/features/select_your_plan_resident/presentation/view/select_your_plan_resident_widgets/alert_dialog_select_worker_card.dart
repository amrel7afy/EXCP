
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import '../../../../../core/theming/styles.dart';


class AlertDialogSelectWorkerCard extends StatefulWidget {
  final String text;
  final bool selected;
  final String? subText;
  final VoidCallback onTap;

  const AlertDialogSelectWorkerCard({
    super.key,
    required this.text,
    required this.selected,
    this.subText,
    required this.onTap,
  });

  @override
  State<AlertDialogSelectWorkerCard> createState() =>
      _AlertDialogSelectWorkerCardState();
}

class _AlertDialogSelectWorkerCardState
    extends State<AlertDialogSelectWorkerCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.selected ? Colors.grey : Colors.grey[300]),
        width: 130.w,
        height: 100.h,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: MyTextStyles.font14Weight600,
            ),
            if (widget.subText != null) ...[
              const VerticalSpacer(8),
              Text(widget.subText!, style: MyTextStyles.font10Weight500)
            ]
          ],
        ),
      ),
    );
  }
}
