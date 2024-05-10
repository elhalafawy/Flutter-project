import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final VoidCallback onOpenCartPressed;

  CartScreen(
      {required this.cartItems,
      required this.onOpenCartPressed,
      required Map product});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _buildCart(),
    );
  }

  Widget _buildCart() {
    if (widget.cartItems.isEmpty) {
      return Center(
        child: Text('Your cart is empty'),
      );
    } else {
      return ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final product = widget.cartItems[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('\$${product['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  // Remove the product from the cart
                  widget.cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      );
    }
  }
}
