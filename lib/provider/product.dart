import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

  void _toggleStatusBack(bool? oldStatus) {
    isFavorite = oldStatus;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String? token) async {
    bool? oldStatus = isFavorite;
    isFavorite = !isFavorite!;
    notifyListeners();
    final url = Uri.https(
      "e-commerce-d85d2-default-rtdb.firebaseio.com",
      "/products/$id.json?auth=$token",
    );
    try {
      final response = await http.patch(url,
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      print(response.statusCode);

      if (response.statusCode >= 400) {
        _toggleStatusBack(oldStatus);
      }
    } catch (error) {
      _toggleStatusBack(oldStatus);
    }
  }
}
