import 'package:flutter/material.dart';

import '/screens/orders_screen.dart';
import '../widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width * 0.80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            // I hope to use silver appbar here in the future...
            MyDrawerHeader(
              size: size,
            ),
            DrawerButton(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBar(),
                  ),
                );
              },
              buttonIcon: Icons.label_important_outline_sharp,
              buttonText: 'Overview',
              size: size,
            ),
            DrawerButton(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersScreen(),
                  ),
                );
              },
              buttonIcon: Icons.payment,
              buttonText: 'Orders',
              size: size,
            ),
          ],
        ));
  }
}
