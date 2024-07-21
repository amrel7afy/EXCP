import 'package:flutter/material.dart';
import 'package:test1/core/constants/vertical_and_horizontal_space.dart';
import '../../../data/order_model.dart';
import 'my_order_expansion_list_view.dart';
import 'my_orders_tab_bar.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


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
      padding: const EdgeInsets.all(23),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child:MyOrdersTabBar(tabController: _tabController) ,
          ),

          const VerticalSpacer(23),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MyOrdersExpansionListView(orders: personOrders),
                MyOrdersExpansionListView(orders: hoursOrders),
                MyOrdersExpansionListView(orders: businessOrders),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


