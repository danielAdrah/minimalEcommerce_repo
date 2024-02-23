import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/model/shop_model.dart';
import 'package:provider/provider.dart';
import '../components/my_drawer.dart';
import '../components/my_product_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ShopModel>(context).shop;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shop And Roll'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Take And Pick From Our Premium Products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
