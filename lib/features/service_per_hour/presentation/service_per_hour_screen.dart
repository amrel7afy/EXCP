import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/show_alert_dialog.dart';
import '../../home/presentation/components/sevice_card.dart';
import 'components/service_alert_dialog_content.dart';

class ServicePerHourScreen extends StatelessWidget {
  const ServicePerHourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'اختر الخدمة',
          leading: true,
          leadingPressed: () {},
        ),
        body:  SafeArea(child: Padding(
          padding: EdgeInsets.all(32),
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
        )),
      ),
    );
  }
}
