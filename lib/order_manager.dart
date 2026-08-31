import 'package:flutter/foundation.dart';

import 'cart_manager.dart';

class OrderRecord {
  OrderRecord({
    required this.id,
    required this.items,
    required this.placedAt,
    required this.total,
  });

  final String id;
  final List<CartItem> items;
  final DateTime placedAt;
  final double total;

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);
  String get summary => items.length == 1 ? items.first.product.name : '${items.length} items';
}

class OrderManager extends ChangeNotifier {
  OrderManager._();

  static final OrderManager instance = OrderManager._();

  final List<OrderRecord> _orders = [];

  List<OrderRecord> get orders => List.unmodifiable(_orders);

  void addFromCart(List<CartItem> items) {
    if (items.isEmpty) return;

    final total = items.fold(
      0.0,
      (sum, item) => sum + _parsePrice(item.product.price) * item.quantity,
    );

    _orders.insert(
      0,
      OrderRecord(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        items: List<CartItem>.from(
          items.map((item) => CartItem(product: item.product, quantity: item.quantity)),
        ),
        placedAt: DateTime.now(),
        total: total,
      ),
    );

    notifyListeners();
  }

  double _parsePrice(String priceText) {
    final sanitized = priceText.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(sanitized) ?? 0;
  }
}
