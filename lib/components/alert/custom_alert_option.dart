/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:enaya/components/text/custom_auto_size_text.dart';
import 'package:enaya/components/button/button.dart';
import 'package:enaya/utility/all_app_words.dart';
import 'package:enaya/utility/app_theme.dart';

 customAlertOptional({
   required String title,
   required String alertType,
   required Function onTap,
   required Function onCancel ,
   String? textButton,
   double? widthTextButton,
   String? textSecondButton,
   bool barrierDismissible = false,
   bool willPopScope = true,

 })  {
   return showDialog(
    barrierDismissible: barrierDismissible,
    context: Get.context!,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return WillPopScope(
            onWillPop: ()async{
              return willPopScope ;
            },
            child: SimpleDialog(
              insetPadding: EdgeInsets.all(20.sp),
              contentPadding: EdgeInsets.all(18.sp),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(30.sp))),
              children: [
                SizedBox(
                  width: 1.sw,
                  child: Padding(
                    padding:  EdgeInsets.zero,
                    child: Column(
                      children: [
                        SizedBox(height: 6.h,),
                        CustomTextAutoSize(
                          text: alertType,
                          maxLines: 1,
                          fontSize: 24.sp,
                          textAlign: TextAlign.center,
                          color: AppColors.mainColor,
                          fontFamily: AppFonts.fontMedium,
                        ),
                        SizedBox(height: 18.h,),
                        CustomTextAutoSize(
                          text: title,
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                          color: AppColors.black,
                          fontFamily: AppFonts.fontRegular,
                        ),
                        SizedBox(height: 24.h,),
                        CustomButton(
                          width: widthTextButton ?? 150.w,
                          onPressed:  () => onTap(),
                          text: textButton ?? GlobalWords.ok.tr,
                        ),
                        SizedBox(height: 16.h,),
                        CustomButton(
                          colorFont: AppColors.black,
                          width: 100.w,
                          color: AppColors.secondaryColor,
                          onPressed:  ()=>onCancel(),
                          text: textSecondButton ??  AppWords.cancel.tr,
                        ),
                         SizedBox(height: 8.h,),
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
