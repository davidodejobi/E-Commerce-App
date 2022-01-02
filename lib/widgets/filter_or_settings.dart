import 'package:e_commerce_app/models/filter.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

enum filterOptions {
  all,
  favorites,
}

class FilterOrSettings extends StatelessWidget {
  const FilterOrSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<Filter>(context);
    return Expanded(
      flex: 3,
      child: Container(
        child: PopupMenuButton(
          icon: const Icon(
            Icons.tune_rounded,
            color: Colors.white,
          ),
          onSelected: (filterOptions value) {
            if (value == filterOptions.favorites) {
              filter.trueFilter();
            } else {
              filter.falseFilter();
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: filterOptions.all,
                child: Text('Favorites'),
              ),
              const PopupMenuItem(
                value: filterOptions.favorites,
                child: Text('All'),
              ),
            ];
          },
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
