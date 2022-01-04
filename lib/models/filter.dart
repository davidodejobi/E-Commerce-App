import 'package:flutter/foundation.dart';

class Filter with ChangeNotifier {
  var selectedOption = false;

  void favoriteFilter() {
    selectedOption = true;
    notifyListeners();
  }

  void allFilter() {
    selectedOption = false;
    notifyListeners();
  }
}
