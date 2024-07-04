import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

import '../../../../../core/constants/methods.dart';
import '../../../../../core/theming/my_colors.dart';
import 'list_of_address.dart';

class SelectAddressBody extends StatefulWidget {
  const SelectAddressBody({super.key});

  @override
  State<SelectAddressBody> createState() => _SelectAddressBodyState();
}

class _SelectAddressBodyState extends State<SelectAddressBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "اختيار العنوان من عناوينك السابقة",
                  style: MyTextStyles.font18Weight500
                      .copyWith(color: Colors.black),
                ),
                const VerticalSpacer(24),
                const VerticalSpacer(20),
              ],
            ),
          ),
          const AddressList(),
          SliverToBoxAdapter(
              child: Column(
            children: [
              const VerticalSpacer(16),
              Container(
                height: 115.h,
                width: getWidth(context),
                padding: const EdgeInsets.only(left: 22, right: 22, top: 23),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: MyColors.kAppBarBackGroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: getWidth(context) * 0.6,
                      child: AutoSizeText(
                        'شارع الامام مالك بن انس، الريان، الخرج 16439، السعودية',
                        style: MyTextStyles.font16Weight500.copyWith(
                          color: MyColors.kPrimaryColor,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      'لا يمكن خدمتكم في هذا العنوان',
                      style: MyTextStyles.font14Weight500
                          .copyWith(color: Colors.red, height: 2),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
