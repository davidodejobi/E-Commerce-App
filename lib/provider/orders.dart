import 'package:flutter/foundation.dart';
import '/provider/provider.dart';

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
  final _orders = [];

  List<OrderItem> get orders => List.unmodifiable(_orders);

  void addOrder(List<BaseCartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: cartProducts));
    notifyListeners();
  }
}
