import 'package:flutter/material.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/features/design_your_offer/presentation/view/widgets/select_your_plan_view_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class DesignYourOfferView extends StatelessWidget {
  const DesignYourOfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appTextDirection,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'صمم باقتك',

          leadingPressed: () {
            context.pop();
          },
        ),
        body: const SafeArea(child: DesignYourOfferViewBody()),
      ),
    );
  }
}
