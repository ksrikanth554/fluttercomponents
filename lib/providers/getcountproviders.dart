

import 'package:flutter/cupertino.dart';

class NumberProvider extends ChangeNotifier{
  

 int _counter=0;
 int get counter=>_counter;

  set counter(int counter){
      _counter=counter+2;
      notifyListeners();
  }
  int increment(){
    counter++;
    notifyListeners();
  }
  
  }