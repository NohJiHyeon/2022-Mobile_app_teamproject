import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
// 기프티콘 리스트 옵션 저장하는 Provider

class SortOption with ChangeNotifier{
  // DEFAULT: 시간순
  String option = 'EXPIRATION';


  // 등록순
  void set_registration_mode(){
    option = 'REGISTRATION';
    notifyListeners();
  }

  void set_expiration_mode(){
    option = 'EXPIRATION';
    notifyListeners();
  }

}