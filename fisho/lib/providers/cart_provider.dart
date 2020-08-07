import 'dart:collection';

import 'package:fisho/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier { 
  final List<Cart> _items = []; 
  UnmodifiableListView<Cart> get items => UnmodifiableListView(_items); 
  
  void add(int id) {
    _items.add(Cart(
      id: id,
      quantity: 1
    )); 
    notifyListeners();
  }

  void incrementQuantity(int id) {

  }

  void decrementQuantity(int id) {

  }

  void removeItem(int id) {
    
  }
 
  void removeAll() { 
    notifyListeners();
  }
}
