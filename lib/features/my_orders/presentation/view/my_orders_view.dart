import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/my_orders/presentation/view/widgets/my_orders_view_body.dart';

import '../../../../core/AppRouter.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'طلباتي',
        ),
        body: const SafeArea(child: MyOrdersViewBody()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(AppRouter.addNewOrderView);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerFloat,
      ),
    );
  }
}
