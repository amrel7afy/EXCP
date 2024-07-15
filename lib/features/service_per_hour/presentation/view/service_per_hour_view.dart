import 'package:flutter/material.dart';
import 'package:test1/features/service_per_hour/presentation/view/widgets/service_per_hour_view_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ServicePerHourView extends StatelessWidget {
  const ServicePerHourView({super.key});

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
        body: const SafeArea(child: ServicePerHourBody()),
      ),
    );
  }
}
