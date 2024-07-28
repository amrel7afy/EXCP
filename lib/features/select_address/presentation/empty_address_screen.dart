import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'components/empty_address_widgets/empty_address_view_body.dart';

class EmptyAddressScreen extends StatelessWidget {
  const EmptyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child:  const Scaffold(
        appBar: CustomAppBar(
          title: 'اختيار العنوان',
        ),
        body: SafeArea(child: EmptyAddressBody()),
      ),
    );
  }
}
