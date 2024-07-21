/*
import 'package:apple_view/routes/apple_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:enaya/components/text/custom_auto_size_text.dart';
import 'package:enaya/components/button/button.dart';
import 'package:enaya/utility/all_app_words.dart';
import 'package:enaya/utility/app_theme.dart';

import '../../routes/routes.dart';
import '../../utility/app_setting.dart';

customAlertContactUs({
  String? title,
  bool barrierDismissible = false,
  bool willPopScope = true,
}) {
  return showDialog(
    barrierDismissible: barrierDismissible,
    context: Get.context!,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return WillPopScope(
            onWillPop: () async {
              return willPopScope;
            },
            child: SimpleDialog(
              insetPadding: EdgeInsets.all(20.sp),
              contentPadding: EdgeInsets.all(18.sp),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.sp))),
              children: [
                SizedBox(
                  width: 1.sw,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6.h,
                        ),
                        CustomTextAutoSize(
                          text: AlertType.error.tr,
                          maxLines: 1,
                          fontSize: 24.sp,
                          textAlign: TextAlign.center,
                          color: AppColors.mainColor,
                          fontFamily: AppFonts.fontMedium,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomTextAutoSize(
                          text: title ?? (isArabic? "هناك خطأ ما الرجاء المحاوله مرة اخرى لاحقاً":""),
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                          color: AppColors.black,
                          fontFamily: AppFonts.fontRegular,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomButton(
                          width: 200.w,
                          onPressed: () {
                            goBack();
                            goToScreen(screenNames:ScreenNames.callUs);
                          },
                          text: isArabic ? "تواصل معنا" : "ContactUS",
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        CustomButton(
                          colorFont: AppColors.black,
                          width: 130.w,
                          color: AppColors.secondaryColor,
                          onPressed: () {
                            goBack();
                          },
                          text: GlobalWords.back.tr,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
*/
