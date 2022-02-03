import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class PopCustomAppBar extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final VoidCallback? onPressed;
  final IconData? icon;
  const PopCustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedIconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.pink[200],
              size: 20,
            ),
          ),
          title!,
          leading!,
        ],
      ),
    );
  }
}
