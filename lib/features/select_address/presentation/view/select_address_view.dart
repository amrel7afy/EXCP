import 'package:flutter/material.dart';
import 'package:test1/features/select_address/presentation/view/widgets/select_address_view_body.dart';
import 'package:test1/main.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SelectAddressView extends StatelessWidget {
  const SelectAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'اختيار العنوان',
        ),
        body: const SafeArea(child: SelectAddressBody()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
