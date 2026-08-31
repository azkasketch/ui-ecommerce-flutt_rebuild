import 'package:flutter/material.dart';

import 'models/product.dart';

class CartItem {
  CartItem({
    required this.product,
    this.quantity = 1,
  });

  final Product product;
  int quantity;
}

class CartManager extends ChangeNotifier {
  CartManager._();

  static final CartManager instance = CartManager._();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);

  double get subtotal => _items.fold(
        0.0,
        (total, item) => total + _parsePrice(item.product.price) * item.quantity,
      );

  void addProduct(Product product) {
    final existing = _items.indexWhere((item) => item.product.name == product.name);
    if (existing >= 0) {
      _items[existing].quantity += 1;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    final index = _items.indexWhere((item) => item.product.name == product.name);
    if (index < 0) return;

    if (quantity <= 0) {
      _items.removeAt(index);
    } else {
      _items[index].quantity = quantity;
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double _parsePrice(String priceText) {
    final sanitized = priceText.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(sanitized) ?? 0;
  }
}
