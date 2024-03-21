import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter; // Getter for accessing the counter value

  void increment() {
    _counter++;
    notifyListeners(); // Notify listeners when the counter changes
  }
}
