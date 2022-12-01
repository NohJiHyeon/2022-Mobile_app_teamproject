import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
// 기프티콘 리스트 옵션 저장하는 Provider

class SortOption with ChangeNotifier{
  // DEFAULT: 시간순
  String option = 'TIME';


  // 브랜드 순
  void set_brand_mode(){
    option = 'BRAND';
    notifyListeners();
  }

  void set_time_mode(){
    option = 'TIME';
    notifyListeners();
  }

}