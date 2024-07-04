import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/features/service_per_hour/presentation/view/widgets/service_per_hour_view_body.dart';
import 'package:test1/main.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ServicePerHourView extends StatelessWidget {
  const ServicePerHourView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(title: 'اختر الخدمة',),
        body: SafeArea(child: ServicePerHourBody()),
      ),
    );
  }
}

