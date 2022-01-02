import 'package:flutter/foundation.dart';

class Filter with ChangeNotifier {
  var selectedOption = false;

  void falseFilter() {
    selectedOption = true;
    notifyListeners();
  }

  void trueFilter() {
    selectedOption = false;
    notifyListeners();
  }
}
