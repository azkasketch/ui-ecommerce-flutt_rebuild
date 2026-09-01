import 'package:flutter/foundation.dart';

import 'cart_manager.dart';

class OrderRecord {
  OrderRecord({
    required this.id,
    required this.items,
    required this.placedAt,
    required this.total,
    required this.paymentMethod,
  });

  final String id;
  final List<CartItem> items;
  final DateTime placedAt;
  final double total;
  final String paymentMethod;

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);
  String get summary => items.length == 1 ? items.first.product.name : '${items.length} items';
  String get orderNumber => '#BK-${id.substring(id.length - 5)}';
}

class OrderManager extends ChangeNotifier {
  OrderManager._();

  static final OrderManager instance = OrderManager._();

  final List<OrderRecord> _orders = [];

  List<OrderRecord> get orders => List.unmodifiable(_orders);

  void addFromCart(List<CartItem> items, {String paymentMethod = 'E-Wallet'}) {
    if (items.isEmpty) return;

    final total = items.fold(
      0.0,
      (sum, item) => sum + _parsePrice(item.product.price) * item.quantity,
    );
    final now = DateTime.now();

    _orders.insert(
      0,
      OrderRecord(
        id: now.microsecondsSinceEpoch.toString(),
        items: List<CartItem>.from(
          items.map((item) => CartItem(product: item.product, quantity: item.quantity)),
        ),
        placedAt: now,
        total: total,
        paymentMethod: paymentMethod,
      ),
    );

    notifyListeners();
  }

  double _parsePrice(String priceText) {
    final sanitized = priceText.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(sanitized) ?? 0;
  }
}
