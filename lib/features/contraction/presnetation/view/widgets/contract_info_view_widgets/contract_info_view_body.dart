import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

import '../../../../../../core/theming/my_colors.dart';
import '../../../../../hourly_select_your_plan/presentation/components/collapse_card.dart';
import '../../../../../shared/over_label_container.dart';
import '../../../../../shared/over_label_container_body.dart';
import 'contraction_data_row_actions.dart';
import '../../../../../shared/coupon_form_field.dart';

class ContractInfoViewBody extends StatefulWidget {
  const ContractInfoViewBody({super.key});

  @override
  State<ContractInfoViewBody> createState() => _ContractInfoViewBodyState();
}

class _ContractInfoViewBodyState extends State<ContractInfoViewBody> {
  final List<String> weekDays = [
    'السبت',
    'الاحد',
    'الاثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CouponTextFormField(),
            const VerticalSpacer(20),
             OverLabelContainer(label: 'الأيام المفضلة', body: OverLabelContainerBody(items: weekDays,),),
            const VerticalSpacer(23),
             CollapseCard(
              showVisitPrice: true, onExpandedTap: () {  },
            ),
            const VerticalSpacer(16),
            Text(
              'بإكمالك الخطوات فأنت توافق على',
              style: MyTextStyles.font14Weight500,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                ' شروط و أحكام الشركة',
                style: MyTextStyles.font14Weight500
                    .copyWith(color: MyColors.kGreenColor),
              ),
            ),
            const VerticalSpacer(37),
            const ContractionDataRowActions()
          ],
        ),
      ),
    );
  }
}









