import 'package:flutter/material.dart';

import 'my_order_expansion_list_view.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(),
          MyOrdersExpansionListView()
        ]
      ),
    );
  }
}
