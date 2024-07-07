import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:test1/features/select_address/presentation/view_model/address_cubit/address_state.dart';
import 'address_on_map_view_page.dart';
import 'enter_address_data_page.dart';

class NewAddressBody extends StatefulWidget {
  const NewAddressBody({super.key});

  @override
  State<NewAddressBody> createState() => _NewAddressBodyState();
}

class _NewAddressBodyState extends State<NewAddressBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return PageView(
          controller: context.read<AddressCubit>().pageController,
          children: [
            const EnterAddressDataPage(),
            const AddressOnTheMapViewPage(),
            Container(color: Colors.blue),
          ],
        );
      },
    );
  }
}
