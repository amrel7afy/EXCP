import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

class AttachmentContractCard extends StatelessWidget {
  final VoidCallback onTap;

  const AttachmentContractCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colors.grey[200]),
        height: 87.h,
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 116.w,
              height: 69.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey[400]
              ),
            ),
            const HorizontalSpacer(10),
            Text('الهوية',style: MyTextStyles.font14Weight600,),
            const Spacer(),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_upload_outlined,size: 45,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
