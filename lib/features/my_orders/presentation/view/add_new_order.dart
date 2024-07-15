import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'add_new_order_body/add_new_order_view_body.dart';

class AddNewOrderView extends StatelessWidget {
  const AddNewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'طلب خدمة ساعات',

        ),
        body: SafeArea(child: AddNewOrderViewBody()),
      ),
    );
  }
}
