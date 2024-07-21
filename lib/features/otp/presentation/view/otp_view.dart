import 'package:flutter/material.dart';
import 'package:test1/features/otp/presentation/view/widgets/otp_view_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class OTPVerifyView extends StatelessWidget {
  const OTPVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'اكتب كود التأكيد',
       leading: true,
        ),
        body: SafeArea(child: OTPVerifyViewBody()),

      ),
    );
  }
}
