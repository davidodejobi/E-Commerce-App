import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '/provider/provider.dart';
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
            FutureBuilder(
              future: Provider.of<Orders>(context, listen: false)
                  .fetchAndSetOrders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset(
                      'assets/animations/loading.json',
                    ),
                  );
                } else {
                  if (snapshot.error != null) {
                    return Center(
                      child: Lottie.asset(
                        'assets/animations/error.json',
                      ),
                    );
                  } else {
                    return Consumer<Orders>(
                      builder: (context, cOfOrders, child) => Expanded(
                        child: ListView.builder(
                          itemCount: cOfOrders.orders.length,
                          itemBuilder: (context, index) =>
                              SingleOrderItemWidget(
                            orders: cOfOrders.orders[index],
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
_isLoading
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
*/