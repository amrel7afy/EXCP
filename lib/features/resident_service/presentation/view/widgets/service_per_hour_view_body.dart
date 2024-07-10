import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/core/theming/my_colors.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/core/widgets/custom_button.dart';
import 'package:test1/features/home/presentation/view/widgets/custom_carousel.dart';
import 'package:test1/features/home/presentation/view/widgets/sevice_card.dart';
import 'package:test1/features/select_address/presentation/view/select_address_widgets/address_card.dart';
import 'package:test1/features/service_per_hour/presentation/view/widgets/service_alert_dialog_content.dart';
import 'package:test1/main.dart';

import '../../../../../core/AppRouter.dart';
import '../../../../../core/widgets/show_alert_dialog.dart';
import '../../../../shared/over_label_container.dart';
import '../../../../shared/over_label_container_body.dart';

class ResidentServiceBody extends StatefulWidget {
  const ResidentServiceBody({super.key});

  @override
  State<ResidentServiceBody> createState() => _ResidentServiceBodyState();
}

class _ResidentServiceBodyState extends State<ResidentServiceBody> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "اختر الخدمة المطلوبة",
              style: MyTextStyles.font14Weight500.copyWith(color: Colors.black),
            ),
            const VerticalSpacer(17),
            const SelectAServiceCards(),
            const VerticalSpacer(20),

          ],
        ),
      ),
    );
  }
}

class SelectAServiceCards extends StatefulWidget {
  const SelectAServiceCards({
    super.key,
  });

  @override
  State<SelectAServiceCards> createState() => _SelectAServiceCardsState();
}

class _SelectAServiceCardsState extends State<SelectAServiceCards> {

  bool isSelected=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.grey[300],
      ),
      height: 250.h,
padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AddressCard(
            text: ' سائق خاص',
            isChecked: isSelected,
            onTap: () {
              setState(() {
                isSelected=true;
              });
              context.pushNamed(AppRouter.selectYourPlanResidentView);
            },
            subTitle: 'تقدم الخدمة بعقود شهرية من شهر الي 24 شهر',
          ),
          AddressCard(
            text: ' عاملة منزلية',
            isChecked: !isSelected,
            onTap: () {
              setState(() {
                isSelected=false;
              });
              context.pushNamed(AppRouter.selectYourPlanResidentView);
            },
            subTitle: 'تقدم الخدمة بعقود شهرية من شهر الي 24 شهر',

          ),
        ],
      ),
    );
  }
}
