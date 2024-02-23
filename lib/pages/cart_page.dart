import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_button.dart';
import 'package:minimal_ecommerce/model/shop_model.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../model/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("remove This Item To Your Cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ShopModel>().removePro(product);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  void payMethod(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) => const AlertDialog(
              content: Text("Choose Your Payment"),
            )));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ShopModel>().cart;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Do Some Shoping First"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () {
                                return removeItem(context, item);
                              },
                              icon: const Icon(Icons.remove)),
                        );
                      }),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: MyButton(
                  onTap: () => payMethod(context),
                  child: const Text("Pay Now")),
            )
          ],
        ));
  }
}
