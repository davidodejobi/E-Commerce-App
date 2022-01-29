import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:enum_to_string/enum_to_string.dart';

import '/models/models.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get items => List.unmodifiable(_items);

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite!).toList();
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
      "https://e-commerce-d85d2-default-rtdb.firebaseio.com/products.json",
    );
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      print(extractedData);
      final List<Product> loadedProducts = [];
      print(loadedProducts);
      extractedData.forEach((prodId, prodData) {
        print(loadedProducts);
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          subCategory: EnumToString.fromString(
            SubCategory.values,
            prodData['subCategory'],
          ),
          imageUrl: prodData['imageUrl'],
          isFavorite: prodData['isFavorite'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
  }

  /* 
  Future<void> addProduct(Product product, SubCategory subCategory) {
    final url = Uri.https(
      "e-commerce-d85d2-default-rtdb.firebaseio.com",
      "/products",
    );
    return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'imageUrl': product.imageUrl,
              'categories': product.categories.toString(),
              'subCategory': subCategory.toString(),
              'isFavorite': product.isFavorite,
            }))
        .then((respose) {
      var newProduct = Product(
        id: json.decode(respose.body)['name'],
        title: product.title,
        description: product.description,
        subCategory: subCategory,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct);  // at the start if the line.
      notifyListeners();
    }).catchError((error) {
      print(error);
      throw error;
    });
  }
  */

  Future<void> addProduct(Product product, SubCategory subCategory) async {
    final url = Uri.https(
      "e-commerce-d85d2-default-rtdb.firebaseio.com",
      "/products.json",
    );
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'subCategory': subCategory.toString(),
            'isFavorite': product.isFavorite,
          }));
      var newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        subCategory: subCategory,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct);  // at the start if the line.
      notifyListeners();
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }

    // print(error);
    // throw error;
  }

  void updateProduct(
      String id, Product newProduct, SubCategory subCategory, bool isFavorite) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = Product(
        id: DateTime.now().toString(),
        title: newProduct.title,
        description: newProduct.description,
        subCategory: subCategory,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
        isFavorite: isFavorite,
      );
      notifyListeners();
    } else {}
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
