import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/cart_screen.dart';
import '/widgets/widgets.dart';
import '../constant.dart';
import '../screens/home_screen.dart';
import '/models/models.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  List<Widget> pages = <Widget>[
    const HomePage(),
    //Replace with screen 2
    Container(),
    const CartScreen(),
    //Replace with screen 4
    Container(
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<Manager>(context);
    return Scaffold(
      body: pages[manager.currentIndex!],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            currentIndex: manager.currentIndex!,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 25,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt_sharp,
                  size: 25,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Consumer<Cart>(
                  builder: (_, cart, __) => IconWithBadge(
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                    ),
                    value: cart.itemCount.toString(),
                    color: kPrimaryColor,
                  ),
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              manager.currentTap(index);
            },
          ),
        ),
      ),
    );
  }
}
