import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

enum ProductCategory {
  all,
  popular,
  recent,
  recommended,
}

class Category {
  final ProductCategory id;
  final String title;
  final Color color;

  Category({
    required this.id,
    required this.title,
    this.color = Colors.pink,
  });
}

List<Category> mainCategory = [
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