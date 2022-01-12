import 'package:flutter/foundation.dart';

import '/models/models.dart';

class BaseCartItem with ChangeNotifier {
  final String? id;
  final String? title;
  final String? imageUrl;
  final SubCategory? subCategory;
  final int? quantity;
  final double? price;

  BaseCartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.subCategory,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, BaseCartItem> _items = {};

  Map<String, BaseCartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void addItem({
    String? productId,
    String? title,
    String? imageUrl,
    SubCategory? subCategory,
    double? price,
    bool? isBuying,
  }) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId!,
        (existingCartItem) => BaseCartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          imageUrl: existingCartItem.imageUrl,
          subCategory: existingCartItem.subCategory,
          quantity: existingCartItem.quantity! + 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId!,
        () => BaseCartItem(
          id: DateTime.now().toString(),
          title: title,
          imageUrl: imageUrl,
          subCategory: subCategory,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity! > 1) {
      _items.update(
        productId,
        (existingCartItem) => BaseCartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          imageUrl: existingCartItem.imageUrl,
          subCategory: existingCartItem.subCategory,
          quantity: existingCartItem.quantity! - 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void addSingleItem(String productId) {
    if (_items[productId]!.quantity! > 0) {
      _items.update(
        productId,
        (existingCartItem) => BaseCartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          imageUrl: existingCartItem.imageUrl,
          subCategory: existingCartItem.subCategory,
          quantity: existingCartItem.quantity! + 1,
          price: existingCartItem.price,
        ),
      );
    }

    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  // bool isChecked = false;

  // void buttonChecked(bool? checked) {
  //   isChecked = checked!;
  //   notifyListeners();
  // }

  // void deactivateItem({
  //   String? productId,
  //   bool? isChecked,
  //   int? quantity,
  //   double? price,
  // }) {
  //   if (_items[productId]!.quantity! >= 0 || isChecked == false) {
  //     _items.update(
  //       productId!,
  //       (existingCartItem) => CartItem(
  //         id: existingCartItem.id,
  //         title: existingCartItem.title,
  //         imageUrl: existingCartItem.imageUrl,
  //         subCategory: existingCartItem.subCategory,
  //         quantity: quantity,
  //         price: price,
  //         isBuying: existingCartItem.isBuying,
  //       ),
  //     );
  //   }
  //   notifyListeners();
  // }

  // void activateItem({
  //   String? productId,
  //   bool? isChecked,
  //   // int? quantity,
  //   // double? price,
  // }) {
  //   if (_items[productId]!.quantity! == 0 || isChecked == false) {
  //     _items.update(
  //       productId!,
  //       (existingCartItem) => CartItem(
  //         id: existingCartItem.id,
  //         title: existingCartItem.title,
  //         imageUrl: existingCartItem.imageUrl,
  //         subCategory: existingCartItem.subCategory,
  //         quantity: existingCartItem.quantity,
  //         price: existingCartItem.price,
  //         isBuying: existingCartItem.isBuying,
  //       ),
  //     );
  //   }
  //   notifyListeners();
  // }
}
