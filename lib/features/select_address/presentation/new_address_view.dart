import 'package:flutter/material.dart';
import 'package:test1/features/select_address/presentation/view/new_address_widgets/new_address_view_body.dart';
import 'package:test1/features/select_address/presentation/view/select_address_widgets/select_address_view_body.dart';
import 'package:test1/main.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appTextDirection,
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'إضافة عنوان جديد',
        ),
        body: SafeArea(child: NewAddressBody()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}