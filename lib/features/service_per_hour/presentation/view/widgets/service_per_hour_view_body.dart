import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';
import 'package:test1/features/service_per_hour/presentation/view/widgets/service_alert_dialog_content.dart';

import '../../../../../core/widgets/show_alert_dialog.dart';
import '../../../../home/presentation/components/sevice_card.dart';

class ServicePerHourBody extends StatefulWidget {
  const ServicePerHourBody({super.key});

  @override
  State<ServicePerHourBody> createState() => _ServicePerHourBodyState();
}

class _ServicePerHourBodyState extends State<ServicePerHourBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "اختر الخدمة المطلوبة",
              style: MyTextStyles.font18Weight600.copyWith(color: Colors.black),
            ),
            const VerticalSpacer(17),
            ServiceCard(
              title: 'عاملة تنظيف',
              subTitle: 'تقدم الخدمة بعقود شهرية من شهر الي 24 شهر',
              onTap: () {
                showAlertDialog(context, const ServiceAlertDialogContent());
              },
            ),
            const VerticalSpacer(20),
            ServiceCard(
              title: 'عاملة تنظيف بالمواد المطلوبة',
              subTitle: 'تقدم الخدمة بعقود شهرية من شهر الي 24 شهر',
              onTap: () {showAlertDialog(context, const ServiceAlertDialogContent());},
            ),
            const VerticalSpacer(20),
          ],
        ),
      ),
    );
  }
}

