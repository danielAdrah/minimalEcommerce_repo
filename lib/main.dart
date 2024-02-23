import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/model/shop_model.dart';
import 'package:minimal_ecommerce/pages/cart_page.dart';
import 'package:minimal_ecommerce/themes/light_mode.dart';
import 'pages/intro_page.dart';
import 'pages/shop_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: ((context) => ShopModel()),child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const IntroPage(),
      routes: {
        '/intro_page': ((context) => const IntroPage()),
        '/shop_page': (((context) => const ShopPage())),
        '/cart_page': (((context) => const CartPage())),
      },
    );
  }
}
