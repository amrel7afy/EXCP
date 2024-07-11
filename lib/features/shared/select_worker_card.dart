import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';

class WorkerCard extends StatelessWidget {
  final VoidCallback onTap;

  const WorkerCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          border: Border.all(),
            borderRadius: BorderRadius.circular(14), color: Colors.grey[300]),
        height: 174.h,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 31,
              backgroundColor: Colors.grey,
            ),
            HorizontalSpacer(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اسم العاملة'),
                VerticalSpacer(4),
                Text('التفاصيل'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
