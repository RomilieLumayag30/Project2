import 'package:flutter/material.dart';
import 'menu.dart'; 

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double total = Cart.cartItems.fold(
        0,
        (sum, cartItem) =>
            sum +
            double.parse(cartItem.item.price.substring(1)) *
                cartItem.quantity);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFFEBCC),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFFFEBCC),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: Cart.cartItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(Cart.cartItems[index].item.title),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm Removal"),
                          content: const Text(
                              "Are you sure you want to remove this item?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(true),
                              child: const Text("Remove"),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(false),
                              child: const Text("Cancel"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (direction) {
                    setState(() {
                      Cart.cartItems.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              '${Cart.cartItems[index].item.title} removed')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFDE59),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              Cart.cartItems[index].item.image,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  Cart.cartItems[index].item.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  Cart.cartItems[index].item.price,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.remove, size: 30),
                                onPressed: () {
                                  setState(() {
                                    if (Cart.cartItems[index].quantity > 1) {
                                      Cart.cartItems[index].quantity--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                '${Cart.cartItems[index].quantity}',
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                icon: Icon(Icons.add, size: 30),
                                onPressed: () {
                                  setState(() {
                                    Cart.cartItems[index].quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('P${total.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Place order logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Place Order', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  MenuItem item;
  int quantity;

  CartItem({required this.item, required this.quantity});
}

class Cart {
  static List<CartItem> cartItems = [];

  static void addToCart(CartItem item) {
    bool itemExists = false;
    for (var cartItem in cartItems) {
      if (cartItem.item.title == item.item.title) {
        cartItem.quantity += item.quantity;
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      cartItems.add(item);
    }
  }
}