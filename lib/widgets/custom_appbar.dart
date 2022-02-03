import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final VoidCallback? onLeadingTap;
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.onLeadingTap,
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
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.pink[200],
              size: 20,
            ),
          ),
          title!,
          RoundedIconButton(
            onPressed: onLeadingTap,
            icon: leading,
          ),
        ],
      ),
    );
  }
}
