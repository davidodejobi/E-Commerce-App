import 'package:flutter/material.dart';

import '../constant.dart';

enum ProductCategory {
  all,
  popular,
  recent,
  recommended,
}

class Category {
  final ProductCategory? id;
  final String? title;
  final Color? color;

  Category({
    this.id,
    this.title,
    this.color = Colors.pink,
  });
}

class Categories with ChangeNotifier {
  final _mainCategory = <Category>[
    Category(
      id: ProductCategory.all,
      title: 'All',
      color: kPrimaryColor!,
    ),
    Category(
      id: ProductCategory.popular,
      title: 'Popular',
      color: kPrimaryColor!,
    ),
    Category(
      id: ProductCategory.recent,
      title: 'Recent',
      color: kPrimaryColor!,
    ),
    Category(
      id: ProductCategory.recommended,
      title: 'Recommended',
      color: kPrimaryColor!,
    ),
  ];

  List<Category> get mainCategory => List.unmodifiable(_mainCategory);

  ProductCategory? isPressed;

  void changeCategoryColor() {
    isPressed;
    notifyListeners();
  }
}

  // class FilterCategory with ChangeNotifier {
  //   final product = Provider.of(context)
  //   // if (isPressed == ProductCategory.all) {
  //   //   return mainCategory;
  //   // } else if (isPressed == ProductCategory.popular) {
  //   //   return mainCategory.where((element) => element.id == ProductCategory.popular).toList();
  //   // } else if (isPressed == ProductCategory.recent) {
  //   //   return mainCategory.where((element) => element.id == ProductCategory.recent).toList();
  //   // } else if (isPressed == ProductCategory.recommended) {
  //   //   return mainCategory.where((element) => element.id == ProductCategory.recommended).toList();
  //   // }
  // }


/*

class Category {
  final String id;
  final String title;
  final Color color;
  bool isPressed;

  Category({
    required this.id,
    required this.title,
    this.color = Colors.pink,
    this.isPressed = false,
  });
}

List<Category> mainCategory = [
  Category(
    id: 'c1',
    title: 'All',
    color: kPrimaryColor!,
    isPressed: true,
  ),
  Category(
    id: 'c2',
    title: 'Popular',
    color: kPrimaryColor!,
  ),
  Category(
    id: 'c3',
    title: 'Recent',
    color: kPrimaryColor!,
  ),
  Category(
    id: 'c4',
    title: 'Recommended',
    color: kPrimaryColor!,
  ),
];

*/
