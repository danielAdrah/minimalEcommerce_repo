import 'package:flutter/material.dart';
import 'my_listTile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.shopping_bag,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          MyListTile(
              text: "Shop",
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/shop_page');
              }),
          const SizedBox(
            height: 10,
          ),
          MyListTile(
              text: "Cart",
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              }),
          //here if i want to add another listTile but i should reduce the height to the sizedBox below me
          const SizedBox(
            height: 400,
          ),
          MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamed(context, '/intro_page')),
        ],
      ),
    );
  }
}
