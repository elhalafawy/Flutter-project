import 'package:electric_store/cart.dart';
import 'package:electric_store/favourites.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;
  final List<Map<String, dynamic>> cartItems;
  final List<Map<String, dynamic>> favoriteItems;

  ProductDetail({
    required this.product,
    required this.cartItems,
    required this.favoriteItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUY NOW'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: cartItems,
                    onOpenCartPressed: () {
                      // Handle opening cart screen
                    },
                    product: {},
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navigate to the favorites screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteItems: favoriteItems,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (product['imageUrl'] != null)
                Image.asset(
                  product['imageUrl'],
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 20),
              if (product['name'] != null)
                Text(
                  product['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 10),
              if (product['price'] != null)
                Text(
                  '\$${product['price']}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              SizedBox(height: 20),
              if (product['description'] != null)
                Text(
                  product['description'],
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add the product to the cart
                      _addToCart(context, product);
                    },
                    child: Text('Add to Cart'),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      // Add the product to favorites
                      _addToFavorites(context, product);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, Map<String, dynamic> product) {
    // Add the selected product to the cart
    cartItems.add(product);

    // Show a snackbar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product added to cart')),
    );
  }

  void _addToFavorites(BuildContext context, Map<String, dynamic> product) {
    // Add the selected product to favorites
    favoriteItems.add(product);

    // Show a snackbar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product added to favorites')),
    );
  }
}
