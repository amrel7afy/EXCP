import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import 'package:test1/features/my_orders/presentation/view/widgets/types_of_order_cards.dart';

import '../../../../../core/theming/my_colors.dart';
import '../../../data/order_model.dart';
import '../../view_model/orders_cubit/orders_cubit.dart';
import '../../view_model/orders_cubit/orders_state.dart';
import 'my_order_expansion_list_view.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<List<Order>> listOfOrders = [
    personOrders,
    hoursOrders,
    businessOrders
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(23),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child:TabBar(
              controller: _tabController,

              dividerHeight: 0,
              tabs: [
                Tab(
                  child: Text('الأفراد'),
                ),
                Tab(text: 'الساعات'),
                Tab(text: 'الأعمال'),
              ],
              indicatorColor: MyColors.kPrimaryColor,
              labelColor: MyColors.kPrimaryColor,
              unselectedLabelColor: Colors.white,
            ) ,
          ),

          const VerticalSpacer(23),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MyOrdersExpansionListView(orders: listOfOrders[0]),
                MyOrdersExpansionListView(orders: listOfOrders[1]),
                MyOrdersExpansionListView(orders: listOfOrders[2]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
