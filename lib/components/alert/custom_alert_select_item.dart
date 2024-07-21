/*
import 'package:enaya/components/no_found_data/custom_no_found_data.dart';
import 'package:enaya/components/text/custom_text.dart';
import 'package:enaya/cubits/custom_items_cubits/selectitems_cubit/selectitems_cubit.dart';
import 'package:enaya/utility/all_app_words.dart';
import 'package:enaya/utility/app_theme.dart';
import 'package:enaya/controller/model/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/app_setting.dart';

class CustomAlertSelectItems {
  static customSelectItems({
    required String displayName,
    required SelectitemsCubit selectItemsCubit,
    required Function(Item item) afterSelectItem,
  }) {

      return showDialog(
        context: Get.context!,
        builder: (context) {
          return BlocConsumer<SelectitemsCubit, SelectitemsState>(
            bloc: selectItemsCubit,
            listener: (context, state) {},
            builder: (context, state) {
              return SimpleDialog(
                insetPadding: EdgeInsets.all(20.sp),
                contentPadding: const EdgeInsets.all(0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.sp))),
                // contentPadding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
                title: Column(
                  children: [
                    selectItemsCubit.state.items!=null&& selectItemsCubit.state.items!.length > 10
                        ? SizedBox(
                      height: 48.h,
                      child: Center(
                        child: TextFormField(
                          cursorColor: AppColors.mainColor,
                          onChanged: (val) {
                            //!  Search in Items By text From text Input Field
                            selectItemsCubit.searchInItemsList(val);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText:isArabic?"بحث":"Search",
                            contentPadding:
                            EdgeInsets.only(left: 32.w, right: 32.w, top: 5.h, bottom: 5.h),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.mainColor,
                                fontFamily: AppFonts.fontRegular,
                                fontWeight: AppFonts.w400
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(30.sp),
                              borderSide: const BorderSide(),
                              gapPadding: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular( 30.sp),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                            fontFamily: AppFonts.fontBold,
                          ),
                        )
                        ,
                      ),
                    ) :  const SizedBox(),
                    SizedBox(
                      height:  selectItemsCubit.state.items!=null&&selectItemsCubit.state.items!.length > 10
                          ?16.h:0,
                    ),
                    Text(
                      displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.fontMedium,
                        fontWeight: AppFonts.w700,
                        color: AppColors.secondaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),

                  ],
                ),
                children: [
                  selectItemsCubit.state.items!=null&& selectItemsCubit.state.items!.isNotEmpty
                  ? Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      SizedBox(
                        width: 1.sw,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(3.w, 10.h, 3.w, 30.h),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (int i = 0;
                                    i <
                                        selectItemsCubit
                                            .state.searchItemsList!.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () {
                                      selectItemsCubit.selectItems(
                                          selectItemsCubit
                                              .state.searchItemsList![i]);
                                      afterSelectItem(selectItemsCubit
                                          .state.searchItemsList![i]);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      color: AppColors.white,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              selectItemsCubit.state
                                                  .searchItemsList![i].value
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppFonts.fontRegular,
                                                  fontWeight: AppFonts.w400,
                                                  color: AppColors.black,
                                                  fontSize: 14.sp)),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                30.w, 10.h, 30.w, 10.h),
                                            child:  i==selectItemsCubit
                                                .state.searchItemsList!.length-1?const SizedBox():const Divider(
                                              thickness: 0.5,
                                              height: 0.5,
                                            ),
                                          )
                                        ],
                                      )),
                                    ),
                                  ),
                                selectItemsCubit.state.items!.isEmpty &&
                                        selectItemsCubit.state.searchWord ==
                                            null
                                    ? Padding(
                                        padding: EdgeInsets.all(16.h),
                                        child: Text(
                                          isArabic
                                              ? "لا تتوفر بيانات فى $displayName "
                                              : "Not Found Data In $displayName",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppFonts.fontMedium,
                                            fontWeight: AppFonts.w700,
                                            color: AppColors.mainColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : const SizedBox(),
                                selectItemsCubit
                                            .state.searchItemsList!.isEmpty &&
                                        selectItemsCubit.state.searchWord !=
                                            null
                                    ? Padding(
                                        padding: EdgeInsets.all(16.h)+EdgeInsets.only(bottom: 16.h),
                                        child: Text(
                                          isArabic
                                              ? ' لا يحتوى على  " ${selectItemsCubit.state.searchWord} "'
                                              : 'No data contain  " ${selectItemsCubit.state.searchWord} "',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppFonts.fontMedium,
                                            fontWeight: AppFonts.w700,
                                            color: AppColors.mainColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.sp),
                                  bottomRight: Radius.circular(30.sp)),
                              color: AppColors.mainColor),
                          child: Padding(
                            padding: EdgeInsets.all(16.h),
                            child: Center(
                              child: CustomText(
                                text: GlobalWords.back.tr,
                                fontSize: 18.sp,
                                fontFamily: AppFonts.fontMedium,
                                fontWeight: AppFonts.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  : Container(
                      width: 1.sw,
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: const NoFoundData())
                ],
              );
            },
          );
        },
      );

  }
}
*/
