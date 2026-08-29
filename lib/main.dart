import 'package:flutter/material.dart';

import 'pages/account_page.dart';
import 'pages/cart_page.dart';
import 'pages/detail_page.dart';
import 'pages/detail_chat.dart';
import 'pages/home_page.dart';
import 'pages/list_chat.dart';
import 'pages/login_page.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(
      seedColor: coral,
      brightness: Brightness.dark,
      surface: ink,
    );
    return MaterialApp(
      title: 'Vanta Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ink,
        colorScheme: scheme.copyWith(
          primary: coral,
          secondary: mint,
          surface: ink,
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ink,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surface,
          labelStyle: const TextStyle(color: muted),
          hintStyle: const TextStyle(color: muted),
          prefixIconColor: muted,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: coral, width: 1.2),
          ),
        ),
      ),
      initialRoute: 'LoginPage',
      routes: {
        'LoginPage': (context) => const LoginPage(),
        'AccountPage': (context) => const AccountPage(),
        'CartPage': (context) => const CartPage(),
        'ListChat': (context) => ListChatPage(),
        'ChatDetail': (context) => const ChatScreen(contactName: 'Vanta concierge'),
        'ItemsPage': (context) => const ProductDetailPage(),
        '/': (context) => const HomePage(),
      },
    );
  }
}
