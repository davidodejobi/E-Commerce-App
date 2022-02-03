import 'package:flutter/cupertino.dart';

class Manager with ChangeNotifier {
  int? currentIndex = 0;

  void currentTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void gotoHomePage() {
    currentIndex = 0;
    notifyListeners();
  }

  void gotoCartPage() {
    currentIndex = 2;
    notifyListeners();
  }
}
