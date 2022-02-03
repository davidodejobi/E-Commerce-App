import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:enum_to_string/enum_to_string.dart';

import '/models/http_exception.dart';
import '/provider/provider.dart';

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

      final List<Product> loadedProducts = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          description: prodData['description'],
          id: prodId,
          imageUrl: prodData['imageUrl'],
          isFavorite: prodData['isFavorite'],
          price: prodData['price'],
          subCategory: EnumToString.fromString(
              SubCategory.values, prodData['subCategory'].split('.').last),
          title: prodData['title'],
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

  Future<void> updateProduct(String id, Product newProduct,
      SubCategory subCategory, bool isFavorite) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.https(
        "e-commerce-d85d2-default-rtdb.firebaseio.com",
        "/products/$id.json",
      );
      http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
            'subCategory': subCategory.toString(),
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {}
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.https(
      "e-commerce-d85d2-default-rtdb.firebaseio.com",
      "/products/$id.json",
    );
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
  }
}

//   Future<void> deleteProduct(String id) async {
//     final url = Uri.https(
//       "e-commerce-d85d2-default-rtdb.firebaseio.com",
//       "/products/$id",
//     );
//     final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
//     var existingProduct = _items[existingProductIndex];
//     try { 
//       final response = await http.delete(url);
//       if (response.statusCode >= 400) {
//         throw HttpException('Could not delete product.');
//       }
//       existingProduct = null as Product;
//     } catch (_) {
//       _items.insert(existingProductIndex, existingProduct);
//       notifyListeners();
//     }
//     _items.removeWhere((prod) => prod.id == id);
//     notifyListeners();
//   }

