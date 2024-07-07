import 'package:flutter/material.dart';
import 'package:test1/main.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'empty_address_widgets/empty_address_view_body.dart';

class EmptyAddressView extends StatelessWidget {
  const EmptyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child:  Scaffold(
        appBar: CustomAppBar(
          title: 'اختيار العنوان', leadingPressed: () {  },
        ),
        body: const SafeArea(child: EmptyAddressBody()),
      ),
    );
  }
}
