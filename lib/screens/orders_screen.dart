import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/models.dart';
import '/constant.dart';
import '/widgets/widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cOfOrders = Provider.of<Orders>(context);
    return Scaffold(
        drawer: MyDrawer(size: size),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: CustomAppBar(
                  title: Text('Orders'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cOfOrders.orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleOrderItem(
                      orders: cOfOrders.orders[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}