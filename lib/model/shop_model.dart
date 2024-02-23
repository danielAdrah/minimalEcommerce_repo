import 'package:flutter/material.dart';

import 'product.dart';
import 'package:provider/provider.dart';

class ShopModel extends ChangeNotifier {
  //list of product for sale
  final List<Product> _shop = [
    Product(
        name: "T-shirt",
        price: 200,
        description: "description",
        imagePath: "assets/shirt.jpg"),
    Product(
        name: "Sport Shoes",
        price: 350,
        description: "description",
        imagePath: "assets/shoes.jpg"),
    Product(
        name: "Sport Classic Watch",
        price: 600,
        description: "description",
        imagePath: "assets/watch.jpg"),
    Product(
        name: "Black Pants",
        price: 400,
        description: "description",
        imagePath: "assets/pants.jpg"),
  ];
  //user cart
  List<Product> _cart = [];

  //get the list
  List<Product> get shop => _shop;

  //get the cart
  List<Product> get cart => _cart;

  //function to add to the cart
  void addPro(Product pro) {
    _cart.add(pro);
    notifyListeners();
  }

  //to remove
  void removePro(Product pro) {
    _cart.remove(pro);
    notifyListeners();
  }
}
