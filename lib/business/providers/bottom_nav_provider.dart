import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int selectedIndex = 0;

  //--------------- Ontap change screen --------------
  void onTapChangeScreen(index) {
    selectedIndex = index;
    notifyListeners();
  }
}
