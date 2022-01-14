import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class PopCustomAppBar extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  const PopCustomAppBar({Key? key, this.title, this.leading}) : super(key: key);

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
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
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
