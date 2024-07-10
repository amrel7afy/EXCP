import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class SelectYourWorkerViewBody extends StatefulWidget {
  const SelectYourWorkerViewBody({super.key});

  @override
  State<SelectYourWorkerViewBody> createState() =>
      _SelectYourWorkerViewBodyState();
}

class _SelectYourWorkerViewBodyState
    extends State<SelectYourWorkerViewBody> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.k21ViewPadding,
                vertical: AppConstants.k8Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

            ),
          ),
        ),

      ],
    );
  }
}
