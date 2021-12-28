import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
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
    id: 'c1',
    title: 'All',
    color: kPrimaryColor!,
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
