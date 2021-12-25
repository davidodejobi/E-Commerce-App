import 'package:flutter/material.dart';

import '../constant.dart';

class FilterOrSettings extends StatelessWidget {
  const FilterOrSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.tune_rounded,
            color: kSecondaryColor,
            size: 25,
          ),
        ),
        margin: const EdgeInsets.only(
          left: kDefaultPadding / 4,
          right: kDefaultPadding,
        ),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            kDefaultPadding / 2,
          ),
          gradient: kDefaultGradient,
          boxShadow: [
            kDefaultShadow,
          ],
        ),
      ),
    );
  }
}
