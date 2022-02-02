import 'package:e_commerce_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

enum filterOptions {
  favorites,
  all,
}

class FilterOrSettings extends StatelessWidget {
  const FilterOrSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<Filter>(context);
    return Expanded(
      flex: 2,
      child: Container(
        child: PopupMenuButton(
          icon: const Icon(
            Icons.tune_rounded,
            color: Colors.white,
          ),
          onSelected: (filterOptions value) {
            if (value == filterOptions.favorites) {
              filter.favoriteFilter();
            } else {
              filter.allFilter();
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: filterOptions.favorites,
                child: Text('Favorites'),
              ),
              const PopupMenuItem(
                value: filterOptions.all,
                child: Text('All'),
              ),
            ];
          },
        ),
        margin: const EdgeInsets.only(
          left: kDefaultPadding / 4,
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
