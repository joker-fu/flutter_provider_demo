import 'package:flutter/foundation.dart';

class CounterNotifier with ChangeNotifier {
  int _count = 0;
  int _count1 = 0;
  int _buildCount = 0;

  int get count => _count;

  int get count1 => _count1;

  int get buildCount => _buildCount;

  increment() {
    _count++;
    notifyListeners();
  }

  increment1() {
    _count1++;
    notifyListeners();
  }
}
