import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [itemName ,itemPrice , iamgePath , color]
    ["Avocado", "4.00", "assets/images/avocado.png", Colors.green],
    ["Banana", "2.50", "assets/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "assets/images/chicken.png", Colors.brown],
    ["Water", "1.00", "assets/images/water.png", Colors.blue],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add items to cart
  void addItemsToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove items from cart 
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price 
  String calculateTotal() {
    double totalPrice = 0;

    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }

    return totalPrice.toStringAsFixed(2);
  }
}
