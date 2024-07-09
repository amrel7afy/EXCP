import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/constants/constants.dart';
import 'package:test1/features/my_orders/data/order_model.dart';
import 'package:test1/features/my_orders/presentation/view/widgets/my_orders_collapse_card.dart';
import 'package:test1/features/my_orders/presentation/view_model/orders_cubit/orders_cubit.dart';

import '../../view_model/orders_cubit/orders_state.dart';

class MyOrdersExpansionListView extends StatefulWidget {
  final List<Order> orders;

  const MyOrdersExpansionListView({
    super.key,
    required this.orders,
  });

  @override
  State<MyOrdersExpansionListView> createState() =>
      _MyOrdersExpansionListViewState();
}

class _MyOrdersExpansionListViewState extends State<MyOrdersExpansionListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.orders.length,
        itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
            AppConstants.k21ViewPadding, 0, AppConstants.k21ViewPadding, 17.0),
        child: MyOrdersCollapseCard(
          isNew: index == 0 ? true : false,
          order: widget.orders[index],
        ),
      );
    });
  }
}
