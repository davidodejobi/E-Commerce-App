import 'package:flutter/material.dart';

import '/constant.dart';
import '/widgets/widgets.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: MyDrawer(size: size),
        body: SafeArea(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: CustomAppBar(
                  title: Text('Orders'),
                ),
              ),
            ],
          ),
        ));
  }
}
