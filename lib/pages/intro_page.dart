import 'package:flutter/material.dart';
import '../components/my_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.shopping_bag,
            size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Minimal Shop",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Premium Quality Product",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            onTap: () => Navigator.pushNamed(context, '/shop_page'),
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ]),
      ),
    );
  }
}
