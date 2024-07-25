import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class AddNewOrderView extends StatelessWidget {
  const AddNewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child:  Scaffold(
        appBar: const CustomAppBar(
          title: 'طلب خدمة ساعات',

        ),
        body: SafeArea(child: Container()),
      ),
    );
  }
}
