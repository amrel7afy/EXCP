import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/features/select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';
import '../../../../../core/theming/styles.dart';
import '../../view_model/choose_worker_cubit/choose_worker_state.dart';
import 'choose_deliver_to_home_or_from_company_row.dart';
import 'choose_from_app_or_company_row.dart';

class ResidentAlertDialogContent extends StatefulWidget {
  const ResidentAlertDialogContent({
    super.key,
  });

  @override
  State<ResidentAlertDialogContent> createState() =>
      _ResidentAlertDialogContentState();
}

class _ResidentAlertDialogContentState
    extends State<ResidentAlertDialogContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: BlocProvider(
          create: (context) => ChooseWorkerCubit(),
          child: BlocBuilder<ChooseWorkerCubit, ChooseWorkerState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    'كيف تريد اختيار العاملة',
                    style: MyTextStyles.font18Weight600,
                  ),
                  const VerticalSpacer(32),
                  const ChooseFromAppOrCompanyRow(),
                  if (context.read<ChooseWorkerCubit>().isFromApp)
                    buildWantWorkerFromAppColumn(context),
                  if (!context.read<ChooseWorkerCubit>().isFromApp) ...[
                    buildChooseCompanyBranchColumn()
                  ],
                  SizedBox(
                    width: 108.w,
                    child: CustomButton(
                        borderRadius: BorderRadius.circular(8),
                        textStyle: MyTextStyles.font18Weight500
                            .copyWith(color: Colors.white),
                        text: 'التالي',
                        onPressed: () {
                          if (context.read<ChooseWorkerCubit>().isFromApp) {
                            context.pushReplacementNamed(
                                AppRouter.selectYourWorkerView);
                          } else if (!context
                              .read<ChooseWorkerCubit>()
                              .isFromApp) {
                            context.pushReplacementNamed(
                                AppRouter.residentContractDetailsView);
                          }
                        }),
                  ),
                ],
              );
            },
          )),
    );
  }

  Column buildWantWorkerFromAppColumn(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacer(32),
        Text(
          'طريقة استلام العاملة ؟',
          style: MyTextStyles.font18Weight600,
        ),
        const VerticalSpacer(32),
        const ChooseDeliverToHomeOrFromCompanyRow(),
        if (context.read<ChooseWorkerCubit>().isDelivery) ...[
          const VerticalSpacer(27),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مواعيد التوصيل',
                style: MyTextStyles.font14Weight500,
              ),
              const VerticalSpacer(10),
              buildAMIntervalRow(),
              const VerticalSpacer(5),
              buildPMIntervalRow(),
              const VerticalSpacer(22),
            ],
          )
        ],
        if (!context.read<ChooseWorkerCubit>().isDelivery) ...[
          buildChooseCompanyBranchColumn(),
          const VerticalSpacer(4),
        ],
      ],
    );
  }

  Column buildChooseCompanyBranchColumn() {
    return Column(
      children: [
        const VerticalSpacer(22),
        Text(
          'اختر الفرع',
          style: MyTextStyles.font18Weight600,
        ),
        const VerticalSpacer(10),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[300]),
          child: Text(
            'سكن الرياض نسائي',
            style: MyTextStyles.font14Weight600,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[300]),
          child: Text(
            'سكن جدة نسائي',
            style: MyTextStyles.font14Weight600,
          ),
        )
      ],
    );
  }

  Row buildPMIntervalRow() {
    return Row(
      children: [
        Icon(
          Icons.timer,
          size: 18,
          color: Colors.grey,
        ),
        HorizontalSpacer(5),
        Text(
          'الفترة المسائية : من 4:00 م الي 6:00 م',
          style: MyTextStyles.font12Weight500,
        )
      ],
    );
  }

  Row buildAMIntervalRow() {
    return Row(
      children: [
        Icon(
          Icons.timer,
          size: 18,
          color: Colors.grey,
        ),
        HorizontalSpacer(5),
        Text(
          'الفترة الصباحية : من 7:30 ص الى 9:30 م',
          style: MyTextStyles.font12Weight500,
        )
      ],
    );
  }
}
