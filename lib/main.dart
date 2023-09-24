import 'package:flutter/material.dart';

import 'cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product List'),

        ),
        body: ProductList(),

      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 30),
    Product(name: 'Product 4', price: 40),
    Product(name: 'Product 5', price: 50),
    Product(name: 'Product 6', price: 60),
    Product(name: 'Product 7', price: 70),
    Product(name: 'Product 8', price: 80),
    Product(name: 'Product 9', price: 90),
    Product(name: 'Product 10', price: 100),
    // Add more products here
  ];

  void navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: ProductCounter(
              product: products[index],
              onBuy: () {
                if (products[index].count == 5) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content:
                        Text('You\'ve bought 5 ${products[index].name}!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  setState(() {
                    products[index].count++;
                  });
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCart,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int count = 0;

  Product({required this.name, required this.price});
}

class ProductCounter extends StatelessWidget {
  final Product product;
  final VoidCallback onBuy;

  ProductCounter({required this.product, required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Count: ${product.count}'),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: onBuy,
          child: Text('Buy Now'),
        ),
      ],
    );
  }
}
