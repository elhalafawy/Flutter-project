import 'package:electric_store/favourites.dart';
import 'package:electric_store/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:electric_store/cart.dart';
import 'package:electric_store/product_detail.dart';
import 'package:electric_store/menu_page.dart'; // Import the menu_page.dart file

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = ''; // Track the selected category

  // Define lists of products for each category
  List<Map<String, dynamic>> _products = [
    {
      'name': 'Iphone 13 Pro Max',
      'imageUrl': 'assets/images/phone1.jpeg',
      'price': 1100,
      'category': 'Phones',
      'description':
          'iPhone 13 Pro Max 128GB Sierra Blue 5G With Facetime - International Specs.',
    },
    {
      'name': 'Huawei Mate 40 Pro',
      'imageUrl': 'assets/images/phone2.png',
      'price': 1000,
      'category': 'Phones',
      'description':
          'HUAWEI Mate 40 Pro, 6.7-inch OLED Display, 50MP Ultra Aperture XMAGE Camera, IP68, 4700mAh Battery, Durable Kunlun Glass, 8GB+512GB.',
    },
    {
      'name': 'Iphone 14 Pro Max',
      'imageUrl': 'assets/images/phone3.jpg',
      'price': 900,
      'category': 'Phones',
      'description':
          'iPhone 14 Pro Max 1TB purple 5G With FaceTime - Middle East Version',
    },
    {
      'name': 'Redmi',
      'imageUrl': 'assets/images/phone4.jpg',
      'price': 800,
      'category': 'Phones',
      'description':
          'Redmi Note 13 Pro+ 5G Dual SIM Mystic Silver 12GB RAM 512GB 5G Limited Edition - Global Version',
    },
    {
      'name': 'Samsung Watch 5',
      'imageUrl': 'assets/images/watch1.jpg',
      'price': 400,
      'category': 'Smart Watch',
      'description': 'Galaxy Watch 5 44mm Graphite',
    },
    {
      'name': 'Samsung Watch 4',
      'imageUrl': 'assets/images/watch2.jpg',
      'price': 300,
      'category': 'Smart Watch',
      'description': 'Galaxy Watch 4 Classic 46 mm Black',
    },
    {
      'name': 'Apple Watch 9',
      'imageUrl': 'assets/images/watch3.png',
      'price': 800,
      'category': 'Smart Watch',
      'description':
          'Watch Series 9 GPS 45mm Midnight Aluminium Case With orange Sport Band',
    },
    {
      'name': 'Women Smart Watch',
      'imageUrl': 'assets/images/watch4.jpg',
      'price': 300,
      'category': 'Smart Watch',
      'description':
          'Queen Smart Watch For Women With AMOLED Always On Display Bluetooth Calling Waterproof Fitness Watches',
    },
    {
      'name': 'MSI Laptop',
      'imageUrl': 'assets/images/laptop1.jpeg',
      'price': 1900,
      'category': 'Laptop',
      'description':
          'Cyborg 15 A13VE Gaming Laptop With 15.6-Inch Display, Core i7-13620H Processor/16GB RAM/1TB SSD6GB NVIDIA RTX 4050 Graphics Card/Windows 11 Home English Black',
    },
    {
      'name': 'ASUS Laptop',
      'imageUrl': 'assets/images/laptop2.jpeg',
      'price': 1500,
      'category': 'Laptop',
      'description':
          'laptop Halafawy  With 17-Inch FHD Display, AMD Ryzen 7-8840HS Processor/16GB RAM/1TB SSD/Intel Iris XE Graphics/Windows 11 Jade Black',
    },
    {
      'name': 'MacBook PRO',
      'imageUrl': 'assets/images/laptop3.jpeg',
      'price': 2000,
      'category': 'Laptop',
      'description':
          'MacBook Pro MNEJ3 13-Inch Display : Apple M2 chip with 8-core CPU and 10-core GPU, 512GB SSD,Space Grey',
    },
    {
      'name': 'MacBook Air',
      'imageUrl': 'assets/images/laptop4.jpg',
      'price': 1400,
      'category': 'Laptop',
      'description':
          'Macbook Air MGN63 13" Display, Apple M1 Chip With 8-Core Processor and 7-Core Graphics / 8GB RAM / 256GB SSD/  khalid laptop',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Set a default category when the screen is first loaded
    _selectedCategory = 'Phones';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(89, 190, 230, 1),
        title: Text(
          'Elhalafawy Store',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: ProductSearch(products: _products));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Category",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: 3),
                  buildCategoryButton('Phones'),
                  SizedBox(width: 2),
                  buildCategoryButton('Smart Watch'),
                  SizedBox(width: 1),
                  buildCategoryButton('Laptop'),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              // Display products based on the selected category
              buildProductGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Change this to the index of the current tab
        onTap: (int index) {
          // Handle bottom navigation item taps here
          switch (index) {
            case 0:
              // Handle home button tap
              break;
            case 1:
              // Handle cart button tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: List.empty(),
                    onOpenCartPressed: () {
                      // Handle opening cart screen
                    },
                    product: {},
                  ),
                ),
              );
              break;
            case 2:
              // Handle account button tap Navigator.push(
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    username: 'YourUsername',
                    address: 'YourAddress',
                  ),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteItems: List.empty(),
                  ),
                ),
              );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    bool isSelected = _selectedCategory == category;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected
              ? Color.fromARGB(255, 240, 80, 80)
              : Color.fromRGBO(89, 190, 230, 1),
        ),
      ),
      onPressed: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Text(
        category,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildProductGrid() {
    List<Map<String, dynamic>> filteredProducts =
        getProductsForCategory(_selectedCategory);

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: filteredProducts[index],
        );
      },
    );
  }

  List<Map<String, dynamic>> getProductsForCategory(String category) {
    return _products
        .where((product) => product['category'] == category)
        .toList();
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 150, // Fixed height for the image container
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    product['imageUrl'],
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${product['price']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          product: product,
                          cartItems: [],
                          favoriteItems: [],
                        ),
                      ),
                    );
                  },
                  child: Text('Buy Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSearch extends SearchDelegate<String> {
  final List<Map<String, dynamic>> products;

  ProductSearch({required this.products});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Map<String, dynamic>> searchResults = products
        .where((product) =>
            product['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final product = searchResults[index];
        return ListTile(
          title: Text(product['name']),
          onTap: () {
            // Handle tapping on search result
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  product: product,
                  cartItems: [],
                  favoriteItems: [],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, dynamic>> searchResults = products
        .where((product) =>
            product['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final product = searchResults[index];
        return ListTile(
          title: Text(product['name']),
          onTap: () {
            // Handle tapping on search suggestion
            query = product['name'];
            showResults(context);
          },
        );
      },
    );
  }
}
