import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'product.dart';

class SingleOrderItem {
  final String? id;
  final double? amount;
  final List<Product>? products;
  final Product? product;
  final DateTime? dateTime;

  SingleOrderItem({
    this.id,
    this.amount,
    this.products,
    this.product,
    this.dateTime,
  });
}

class SingleOrder with ChangeNotifier {
  // ignore: prefer_final_fields
  List<SingleOrderItem> _orders = [];

  List<SingleOrderItem> get orders => List.unmodifiable(_orders);

  Future<void> addOrder(List<Product> singleCartProducts, double total) async {
    final url = Uri.https(
      "e-commerce-d85d2-default-rtdb.firebaseio.com",
      "/orders.json",
    );
    final timeStamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        'products': singleCartProducts
            .map((cp) => {
                  'íd': cp.id,
                  'title': cp.title,
                  'quantity': 1,
                  'price': cp.price,
                  'imageUrl': cp.imageUrl,
                  'subCategory': cp.subCategory.toString(),
                })
            .toList(),
      }),
    );

    _orders.insert(
        0,
        SingleOrderItem(
            id: json.decode(response.body)['name'],
            amount: total,
            dateTime: timeStamp,
            products: singleCartProducts));
    notifyListeners();
  }
}
