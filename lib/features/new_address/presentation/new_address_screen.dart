import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/new_address/presentation/new_address_view_model.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../core/constants/constants.dart';
import 'components/address_on_map_view_page.dart';
import 'components/add_new_address_data_page.dart';

class NewAddressView extends StatefulWidget {
  const NewAddressView({super.key});

  @override
  State<NewAddressView> createState() => _NewAddressViewState();
}

class _NewAddressViewState extends State<NewAddressView> {
  NewAddressViewModel newAddressViewModel = NewAddressViewModel();

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
          body: SafeArea(
              child: PageView(
            controller: newAddressViewModel.pageController,
            children: [
              AddNewAddressPage(
                newAddressViewModel: newAddressViewModel,
              ),
              AddressOnTheMapViewPage(
                newAddressViewModel: newAddressViewModel,
              ),
            ],
          ))),
    );
  }

  void leadingPressed(BuildContext context) {
    if (newAddressViewModel.pageController.page == 0) {
      context.pop();
    } else {
      newAddressViewModel.pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
