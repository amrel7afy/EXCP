import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';



class ResidentContractDetailsViewBody extends StatefulWidget {
  const ResidentContractDetailsViewBody({super.key});

  @override
  State<ResidentContractDetailsViewBody> createState() =>
      _ResidentContractDetailsViewBodyState();
}

class _ResidentContractDetailsViewBodyState
    extends State<ResidentContractDetailsViewBody> {

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
