import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/cart_screen.dart';
import '/widgets/widgets.dart';
import '../constant.dart';
import '../screens/home_screen.dart';
import '/provider/provider.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BottomNavBar oldWidget) {
    _controller = ScrollController();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late List<Widget> pages = <Widget>[
    HomePage(
      controller: _controller,
    ),
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
    final itemCount = Provider.of<Cart>(context, listen: true).itemCount;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // IndexedStack allows you to easily switch widgets in your app.
          IndexedStack(
            index: manager.currentIndex!,
            children: pages,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: ScrollToHideWidget(
              // duration: _duration,
              controller: _controller,
              child: bottomNavigationBar(manager, context, itemCount),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(
        size: size,
      ),
      // bottomNavigationBar: bottomNavigationBar(manager, context, itemCount),
    );
  }

  Container bottomNavigationBar(
      Manager manager, BuildContext context, int itemCount) {
    return Container(
      height: kBottomNavigationBarHeight,
      margin: const EdgeInsets.only(
        right: kDefaultPadding * 1.5,
        left: kDefaultPadding * 1.5,
        // right: kDefaultPadding,
      ),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 05),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: BottomNavigationBar(
          currentIndex: manager.currentIndex!,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.shifting,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
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
            itemCount <= 0
                ? const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                    ),
                    label: '',
                  )
                : BottomNavigationBarItem(
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
    );
  }
}
