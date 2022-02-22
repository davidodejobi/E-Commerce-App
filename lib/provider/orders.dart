import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import '/provider/provider.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String? id;
  final double? amount;
  final List<BaseCartItem>? products;
  final Product? product;
  final DateTime? dateTime;

  OrderItem({
    this.id,
    this.amount,
    this.products,
    this.product,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  final String? authToken;

  Orders([this.authToken, this._orders = const []]);

  List<OrderItem> get orders => List.unmodifiable(_orders);

  Future<void> addOrder(List<BaseCartItem> cartProducts, double total) async {
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
        'products': cartProducts
            .map((cp) => {
                  'íd': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                  'imageUrl': cp.imageUrl,
                  'subCategory': cp.subCategory.toString(),
                })
            .toList(),
      }),
    );

    _orders.insert(
        0,
        OrderItem(
            id: json.decode(response.body)['name'],
            amount: total,
            dateTime: timeStamp,
            products: cartProducts));
    notifyListeners();
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
      "https://e-commerce-d85d2-default-rtdb.firebaseio.com/orders.json?auth=$authToken",
    );
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData.isEmpty) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
        id: orderId,
        amount: orderData['amount'],
        dateTime: DateTime.parse(orderData['dateTime']),
        products: (orderData['products'] as List<dynamic>)
            .map(
              (item) => BaseCartItem(
                id: item['id'],
                title: item['title'],
                imageUrl: item['imageUrl'],
                subCategory: EnumToString.fromString(
                    SubCategory.values, item['subCategory'].split('.').last),
                quantity: item['quantity'],
                price: item['price'],
              ),
            )
            .toList(),
      ));
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }
}
