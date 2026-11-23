import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'cart_manager.dart';
import 'main.dart';
import 'order_manager.dart';
import 'pages/account_page.dart';
import 'pages/cart_page.dart';
import 'pages/detail_chat.dart';
import 'pages/detail_page.dart';
import 'pages/home_page.dart';
import 'pages/list_chat.dart';
import 'pages/login_page.dart';
import 'pages/orders_page.dart';
import 'widgets/items_widget.dart';

Widget bakulPreviewWrapper(Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: buildBakulTheme(),
    home: child,
  );
}

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Login',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget loginScreenPreview() => const LoginPage();

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Home',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget homeScreenPreview() => const HomePage();

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Product detail',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget productDetailScreenPreview() =>
    ProductDetailPage(product: products.first);

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Shopping bag',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget shoppingBagScreenPreview() => const Scaffold(body: CartPage());

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Profile',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget profileScreenPreview() => const Scaffold(body: AccountPage());

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Messages',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget messagesScreenPreview() => const ListChatPage();

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Conversation',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget conversationScreenPreview() =>
    const ChatScreen(contactName: 'Bakul concierge');

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Orders',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget ordersScreenPreview() => OrdersPage(orders: [_previewOrder]);

@Preview(
  group: 'Bakul Market / Screens',
  name: 'Order details',
  size: Size(390, 844),
  wrapper: bakulPreviewWrapper,
)
Widget orderDetailsScreenPreview() => OrderDetailPage(order: _previewOrder);

@Preview(
  group: 'Bakul Market / Components',
  name: 'Product grid',
  size: Size(390, 900),
  wrapper: bakulPreviewWrapper,
)
Widget productGridPreview() =>
    const Scaffold(body: SingleChildScrollView(child: Itemswidget()));

final OrderRecord _previewOrder = OrderRecord(
  id: 'preview-order-00001',
  items: [
    CartItem(product: products.first, quantity: 1),
    CartItem(product: products[1], quantity: 2),
  ],
  placedAt: DateTime(2026, 11, 23),
  total: 220,
  paymentMethod: 'E-Wallet',
);
