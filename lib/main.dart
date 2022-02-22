import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/auth_screen.dart';
import '/provider/provider.dart';
import '/provider/theme.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final theme = AppTheme.getTheme(false);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(),
          update: (_, auth, previousProducts) => Products(
            auth.token,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(),
          update: (_, auth, previousOrders) => Orders(
            auth.token,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
        ChangeNotifierProvider(create: (_) => Categories()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Manager()),
        ChangeNotifierProvider(create: (_) => SingleOrder()),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'E Commerce App',
          theme: theme,
          home: auth.isAuth ? const BottomNavBar() : const AuthScreen(),
        ),
      ),
    );
  }
}
