import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/helper/extensions.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/cubit/generic_cubit/generic_cubit.dart';
import 'package:test1/features/select_address/presentation/select_address_view_model.dart';

import '../../../../../core/AppRouter.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../cubit/generic_cubit/generic_state.dart';
import 'address_card.dart';

class AddressList extends StatefulWidget {
  final SelectAddressViewModel selectAddressViewModel;

  const AddressList({super.key, required this.selectAddressViewModel});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericState>(
      bloc: widget.selectAddressViewModel.genericCubit,
      builder: (context, state) {

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return AddressCard(
              text: widget.selectAddressViewModel.locations[index].displayValue,
              isChecked: widget.selectAddressViewModel.selectedIndex == index,
              onTap: () {
                widget.selectAddressViewModel.selectAddress(index);

               /* if (AppConstants.service == Service.hours) {
                  context.pushNamed(AppRouter.selectYourPlanView);
                } else if (AppConstants.service == Service.resident) {
                  context.pushNamed(AppRouter.residentServiceView);
                }*/
              },
            );
          }, childCount: widget.selectAddressViewModel.locations.length),
        );
      },
    );
  }
}
