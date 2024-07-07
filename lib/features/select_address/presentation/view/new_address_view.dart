import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/methods.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/select_address/presentation/view/new_address_widgets/new_address_view_body.dart';
import 'package:test1/features/select_address/presentation/view/select_address_widgets/select_address_view_body.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/main.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/constants/constants.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'إضافة عنوان جديد',
          leadingPressed: () {
            leadingPressed(context);
          },
        ),
        body: const SafeArea(child: NewAddressBody()),
      ),
    );
  }

  void leadingPressed(BuildContext context) {
    if (context.read<AddressCubit>().pageController.page == 0) {
      context.pop();
    } else {
      context.read<AddressCubit>().pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
