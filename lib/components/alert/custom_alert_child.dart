/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utility/app_theme.dart';
import '../text/custom_text.dart';

customAlertChild({
  required BuildContext context,
  required Widget child,
  String? title,
  double? borderRadius ,
  bool barrierDismissible = true,
}) async {
  return await showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SimpleDialog(
            insetPadding: EdgeInsets.all(20.sp),
            contentPadding: EdgeInsets.all(16.sp),
            title: title != null
                ? Center(
              child: CustomText(
                text: title,
                color: AppColors.mainColor,
                fontFamily: AppFonts.fontBold,
                fontSize: 16.sp,
              ),
            ) : null,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.all(Radius.circular(borderRadius ?? 18.sp))),
            children: [child],
          );
        },
      );
    },
  );
}
*/
