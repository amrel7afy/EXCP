import 'package:flutter/material.dart';
import 'package:test1/core/AppRouter.dart';
import 'package:test1/core/helper/extensions.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/vertical_and_horizontal_space.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'components/select_address_widgets/list_of_address.dart';
import 'components/select_address_widgets/not_accessible_address_card.dart';
import 'components/select_address_widgets/select_address_view_body.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'اختيار العنوان',
          leadingPressed: () {},
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(32),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "اختيار العنوان من عناوينك السابقة",
                      style: MyTextStyles.font18Weight500
                          .copyWith(color: Colors.black),
                    ),
                    const VerticalSpacer(24),
                    const VerticalSpacer(20),
                  ],
                ),
              ),
              const AddressList(),
              const NotAccessibleAddressCard()
            ],
          ),
        )),
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
