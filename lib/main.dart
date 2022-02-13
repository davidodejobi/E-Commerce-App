import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/auth_screen.dart';
import '/provider/provider.dart';
import '/provider/theme.dart';

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
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Categories()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Manager()),
        ChangeNotifierProvider(create: (_) => Orders()),
        ChangeNotifierProvider(create: (_) => SingleOrder()),
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MaterialApp(
        title: 'E Commerce App',
        theme: theme,
        home: const AuthScreen(),
      ),
    );
  }
}
