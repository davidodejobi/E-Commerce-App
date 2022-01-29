import 'package:flutter/cupertino.dart';

enum SubCategory {
  women,
  men,
  children,
}

class Product with ChangeNotifier {
  final String? id;

  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final SubCategory? subCategory;
  bool? isFavorite;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.subCategory,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite!;
    notifyListeners();
  }
}
