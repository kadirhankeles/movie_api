import 'package:flutter/cupertino.dart';

class NavigationBarProvider extends ChangeNotifier{
  
  int  selectedIndex = 0;
  void onItemTapped(int index) {
      
      selectedIndex = index;
      notifyListeners();
    
  }

  
}