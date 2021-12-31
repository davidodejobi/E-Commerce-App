import 'package:flutter/material.dart';

import '../constant.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? icon;
  const RoundedIconButton({
    this.onPressed,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onPressed,
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              kDefaultShadow,
            ],
            color: Colors.white,
          ),
          child: icon!),
    );
  }
}
