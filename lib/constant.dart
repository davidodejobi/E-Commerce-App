import 'package:flutter/material.dart';

const kDefaultPadding = 20.0;
final kPrimaryColor = Colors.pink[200];
const kSecondaryColor = Colors.white;
final kDefaultShadow = BoxShadow(
  color: Colors.grey.shade100,
  blurRadius: 35,
  offset: const Offset(0, 5),
  spreadRadius: 0.5,
);
final kDefaultGradient = LinearGradient(
  colors: [
    kPrimaryColor!.withOpacity(0.5),
    kPrimaryColor!,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final kUnselectedGradient = LinearGradient(
  colors: [
    Colors.grey.shade300,
    Colors.grey.shade300,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
