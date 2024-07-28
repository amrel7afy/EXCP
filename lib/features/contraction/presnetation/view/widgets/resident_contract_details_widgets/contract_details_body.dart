import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/shared/back_button.dart';
import 'package:test1/features/shared/next_button.dart';
import 'package:test1/features/shared/select_worker_card.dart';

import '../../../../../../core/AppRouter.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../../../../core/theming/my_colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../select_your_plan_resident/presentation/view_model/choose_worker_cubit/choose_worker_cubit.dart';

class ResidentContractDetailsViewBody extends StatefulWidget {
  const ResidentContractDetailsViewBody({super.key});

  @override
  State<ResidentContractDetailsViewBody> createState() =>
      _ResidentContractDetailsViewBodyState();
}

class _ResidentContractDetailsViewBodyState
    extends State<ResidentContractDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.k21ViewPadding,
                vertical: AppConstants.k8Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showEitherWorkCardOrWillChooseWorkerFormCompany(),
                const VerticalSpacer(16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'تفاصيل التعاقد',
                                  style: MyTextStyles.font14Weight700
                                      .copyWith(color: MyColors.kPrimaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const ContractDetailsCard(),
                    ],
                  ),
                ),
                const VerticalSpacer(30),
                Row(
                  children: [
                    Flexible(
                      child: MyBackButton(
                        onTap: () {
                          context.pop();
                        },
                      ),
                    ),
                    const HorizontalSpacer(40),
                    // Add some space between buttons
                    Flexible(
                      child: NextButton(
                        onTap: () {
                          context.pushNamed(AppRouter.downloadContractView);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  showEitherWorkCardOrWillChooseWorkerFormCompany() {
    if (context.read<ChooseWorkerCubit>().isFromApp) {
      return WorkerCard(onTap: () {});
    } else {
      return Container(
        alignment: Alignment.center,
        width: getWidth(context),
        height: 79.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey[300],
        ),
      );
    }
  }
}

class ContractDetailsCard extends StatelessWidget {
  const ContractDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            thickness: 1,
            height: 0,
            color: MyColors.kPrimaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(11),
                ...List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          'مدة التعاقد:',
                          style: MyTextStyles.font14Weight500.copyWith(
                              color: MyColors.kPrimaryColor, fontSize: 14),
                        ),
                        const HorizontalSpacer(30),
                        Text(
                          '1 اسبوع',
                          style: MyTextStyles.font14Weight500.copyWith(
                            color: MyColors.kGreenColor,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const VerticalSpacer(20)
        ],
      ),
    );
  }
}
