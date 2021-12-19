import 'package:flutter_svg/flutter_svg.dart';

import 'models/models.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = AppTheme.getTheme(false);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce App',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? currentIndex = 0;

  static List<Widget> pages = <Widget>[
    Container(),
    //Replace with screen 1
    Container(),
    //Replace with screen 2
    Container(
      color: Colors.green,
    ),
    //Replace with screen 3
    Container(
      color: Colors.blue,
    ),
    //Replace with screen 4
  ];

  void selectedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex!],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
          left: 30.0,
          right: 30.0,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            currentIndex: currentIndex!,
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
                icon: SvgPicture.asset(
                  'assets/icons/shopping-cart.svg',
                  color: Colors.grey,
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
            onTap: selectedBar,
          ),
        ),
      ),
    );
  }
}
