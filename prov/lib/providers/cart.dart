import 'package:flutter/widgets.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<String> _items = [];
  int get totalPrice => _items.length * 42; 

  void add(String item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}