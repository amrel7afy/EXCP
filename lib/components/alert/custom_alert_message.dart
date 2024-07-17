import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test1/core/helper/extensions.dart';

customAlertMessage(
    {required String? txt,
    required String alertType,
    bool isBarrierDismissible = false,
    Function? onClick}) async {
  return await showDialog(
    barrierDismissible: isBarrierDismissible,
    context: Get.context!,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SimpleDialog(
            insetPadding: EdgeInsets.all(20.sp),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.sp))),
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              alertType
            ),
            children: [
              Stack(
                // overflow: Overflow.visible,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              txt!,
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 62.h)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onClick != null ? onClick() : (){
                        context.pop();
                      };
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.sp),
                              bottomRight: Radius.circular(15.sp)),
                         ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: const Center(
                          child: Text('موافق'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
