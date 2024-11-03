import 'package:flutter/material.dart';
import 'package:restofatlem_14624/product.dart';
import 'package:restofatlem_14624/product_description.dart';
import 'package:restofatlem_14624/cart.dart'; // Pastikan mengimpor CartPage

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map<String, dynamic>> cartItems = [];
  final List<Product> products = [
    Product(
      name: 'Mie Ayam Nigga',
      description:
          '"Mie Ayam Nigga" adalah hidangan mie ayam populer di Indonesia.',
      price: 10000,
      imageUrl: 'assets/images/Mi_ayam_jamur.jpg',
    ),
    Product(
      name: 'Esteh Rizz',
      description:
          '"Esteh Rizz" adalah es teh populer dengan istilah gaul di Indonesia.',
      price: 20000,
      imageUrl: 'assets/images/esteh.jpg',
    ),
  ];

  List<int> quantities = [0, 0];

  void addToCart(Product product, int quantity) {
    for (var item in cartItems) {
      if (item['product'] == product) {
        item['quantity'] += quantity;
        return;
      }
    }
    cartItems.add({'product': product, 'quantity': quantity});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(
                product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Rp ${product.price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.green[700],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantities[index] > 0) quantities[index]--;
                          });
                        },
                      ),
                      Text(quantities[index].toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantities[index]++;
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (quantities[index] > 0) {
                        addToCart(product, quantities[index]);
                        setState(() {
                          quantities[index] = 0;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added to cart')),
                        );
                      }
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
              leading: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDescription(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(cartItems: cartItems),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 8.0),
              Text(
                'Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
