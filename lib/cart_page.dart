import 'package:flutter/material.dart';
import 'main.dart'; // Import the Product class from the main.dart file

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  int getTotalCount() {
    int total = 0;
    for (var product in products) {
      total += product.count;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Products Bought:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              getTotalCount().toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
