import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/widgets/widgets.dart';
import '../constant.dart';
import '/screens/homepage.dart';
import '/models/models.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  List<Widget> pages = <Widget>[
    const HomePage(),
    //Replace with screen 2
    Container(),
    //Replace with screen 3
    Container(
      color: Colors.green,
    ),
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
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/homepage.svg',
                  color: Colors.grey,
                ),
                backgroundColor: Colors.pink[200],
                activeIcon: SvgPicture.asset(
                  'assets/icons/homepage.svg',
                  color: Colors.pink[200],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/invoice.svg',
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/invoice.svg',
                  color: Colors.pink[200],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Consumer<Cart>(
                  builder: (_, cart, ch) => IconWithBadge(
                    child: ch!,
                    value: cart.itemCount.toString(),
                    color: kPrimaryColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/shopping-cart.svg',
                    color: Colors.grey,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/shopping-cart.svg',
                  color: Colors.pink[200],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  color: Colors.grey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  color: Colors.pink[200],
                ),
                label: '',
              ),
            ],
            onTap: manager.currentTap,
          ),
        ),
      ),
    );
  }
}
