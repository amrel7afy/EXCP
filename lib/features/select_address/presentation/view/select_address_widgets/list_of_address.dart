import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/core/theming/styles.dart';

import 'address_card.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return  AddressCard(
          text: '15 طريق الثمامة الفرعي- الرياض المملكة العربية السعودية',
          isChecked: selectedIndex==index,
          onTap: () {
            setState(() {
              selectedIndex=index;
            });
          },
        );
      }, childCount: 3),
    );
  }
}