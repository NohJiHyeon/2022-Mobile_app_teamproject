import 'package:flutter/material.dart';

//날짜 저장하는 provider

class Date with ChangeNotifier{
  DateTime expDate = DateTime.now();

  void changeDate(day){
    expDate = day;
    notifyListeners();
  }

}