

import 'package:flutter/foundation.dart';

class CountModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void changeCount(int newCount) {
    _count = newCount;
    notifyListeners();
  }
}