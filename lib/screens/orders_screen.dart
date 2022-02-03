import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/provider.dart';
import '/constant.dart';
import '/widgets/widgets.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration.zero, () {
    //   setState(() {
    //     _isLoading = true;
    //   });

    Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
    //   .then((_) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   });
    // });
    setState(() {
      _isLoading = true;
    });
    Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cOfOrders = Provider.of<Orders>(context);
    return Scaffold(
        drawer: MyDrawer(size: size),
        body: SafeArea(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                      ),
                      child: CustomAppBar(
                        onLeadingTap: () {},
                        leading: const ProfileImage(),
                        title: const Text('Orders'),
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
