import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/cart_screen.dart';
import '/widgets/widgets.dart';
import '../constant.dart';
import '../screens/home_screen.dart';
import '/models/models.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
    final itemCount = Provider.of<Cart>(context, listen: true).itemCount;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[manager.currentIndex!],
      drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            children: [
              // I hope to use silver appbar here in the future...
              Stack(
                children: [
                  Positioned(
                    top: -200,
                    left: -37.5,
                    child: Container(
                      height: size.height * 0.7,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor!.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -150,
                    left: -50,
                    child: Container(
                      height: size.height * 0.7,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor!.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: kDefaultPadding,
                    child: SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            height: 80,
                            width: 80,
                            imageUrl:
                                'https://avatars.githubusercontent.com/u/63846399?s=400&u=66d28bb6d2d4ddc4c38d1d3a87da5890ca4ceb49&v=4',
                          ),
                          const SizedBox(
                            width: kDefaultPadding,
                          ),
                          Text(
                            'David Odejobi',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: kPrimaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.35,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [kDefaultShadow],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: size.width * 0.7 - 20,
                          child: Center(
                            child: Text('Cart',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .apply(
                                      color: Colors.white,
                                    )),
                          ),
                          decoration: BoxDecoration(
                              gradient: kDefaultGradient,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(200),
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40))),
                        ),
                        Icon(
                          Icons.home,
                          color: kPrimaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
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
      ),
    );
  }
}
