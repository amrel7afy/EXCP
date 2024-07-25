
import 'package:flutter/material.dart';
import 'package:test1/features/resident_service/presentation/view/widgets/service_per_hour_view_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ResidentServiceView extends StatelessWidget {
  const ResidentServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: const Scaffold(
        appBar:  CustomAppBar(
          title: 'اختر المهنة',
          disableDrawer: true,

        ),
        body: SafeArea(child: ResidentServiceBody()),
      ),
    );
  }
}
