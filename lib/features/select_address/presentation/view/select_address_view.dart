import 'package:flutter/material.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/select_address/presentation/view/select_address_widgets/select_address_view_body.dart';
import 'package:test1/main.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SelectAddressView extends StatelessWidget {
  const SelectAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar:  CustomAppBar(
          title: 'اختيار العنوان', leadingPressed: () {  },
        ),
        body: const SafeArea(child: SelectAddressBody()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed(AppRouter.newAddressView);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
