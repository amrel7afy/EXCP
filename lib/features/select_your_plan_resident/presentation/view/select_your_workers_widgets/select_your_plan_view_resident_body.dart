import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/core/widgets/show_alert_dialog.dart';
import 'package:test1/features/shared/select_worker_card.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/my_colors.dart';

class SelectYourWorkerViewBody extends StatefulWidget {
  const SelectYourWorkerViewBody({super.key});

  @override
  State<SelectYourWorkerViewBody> createState() =>
      _SelectYourWorkerViewBodyState();
}

class _SelectYourWorkerViewBodyState extends State<SelectYourWorkerViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.k21ViewPadding,
                vertical: AppConstants.k30ViewPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'اختر العاملة التي تناسبك',
                      style: MyTextStyles.font16Weight600
                          .copyWith(color: MyColors.kPrimaryColor),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 92.w,
                      child: CustomButton(
                        textStyle: MyTextStyles.font12Weight500
                            .copyWith(color: Colors.white),
                        text: 'بحث متقدم',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 6, (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(AppConstants.k21ViewPadding, 0,
                AppConstants.k21ViewPadding, AppConstants.k16ViewPadding),
            child: WorkerCard(
              onTap: () {
                showAlertDialog(
                    context,
                    SizedBox(
                      width: getWidth(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildIMGAndNameRow(),
                          buildLowerDetailsRow(),
                          const VerticalSpacer(24),
                          buildChooseWorkerButton(),
                        ],
                      ),
                    ));
              },
            ),
          );
        }))
      ],
    );
  }

  GestureDetector buildChooseWorkerButton() {
    return GestureDetector(
      onTap: ()=>context.pushReplacementNamed(AppRouter.residentContractDetailsView),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 202.w,
          height: 49.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: MyColors.kPrimaryColor)),
          child: Text(
            'اختيار العاملة والتالي',
            style: MyTextStyles.font16Weight500
                .copyWith(color: MyColors.kPrimaryColor),
          ),
        ),
      ),
    );
  }

  Row buildLowerDetailsRow() {
    return Row(
      children: [
        Container(
          width: 100.w,
          height: 28.h,
          margin: const EdgeInsets.all(7),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey[300]),
        ),
        Container(
          width: 100.w,
          height: 28.h,
          margin: const EdgeInsets.all(7),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey[300]),
        ),
      ],
    );
  }

  Row buildIMGAndNameRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 31,
          backgroundColor: Colors.grey,
        ),
        const HorizontalSpacer(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اسم العاملة',
              style: MyTextStyles.font14Weight600
                  .copyWith(color: MyColors.kPrimaryColor),
            ),
            const VerticalSpacer(4),
            Text('التفاصيل',
                style: MyTextStyles.font14Weight600
                    .copyWith(color: MyColors.kPrimaryColor)),
          ],
        )
      ],
    );
  }
}

