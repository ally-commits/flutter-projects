import 'package:flutter/widgets.dart';

class CounterBloc extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  set counter(int val) {
    _counter = val;
    notifyListeners();
  }
}