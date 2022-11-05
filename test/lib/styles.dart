import 'package:flutter/material.dart';

// 사용법: import './styles.dart';
// AppColor.ORANGE, AppColor.APPBAR_COLOR 등등...

class AppColor {
  static const ORANGE = Color(0xFFE59673); // 브랜드/기프티콘 탭 선택, 기프티콘 선택 완료 버튼 색깔
  static const GRAY = Color(0xFFA5A198);
  static const BRIGHT_GRAY = Color(0XFFBFBEBA);

  static const MaterialColor APPBAR_COLOR = MaterialColor(
    0xffE8B28D,
    const <int, Color>{
      50: const Color(0xffce5641 ),//10%
      100: const Color(0xffb74c3a),//20%
      200: const Color(0xffa04332),//30%
      300: const Color(0xff89392b),//40%
      400: const Color(0xff733024),//50%
      500: const Color(0xff5c261d),//60%
      600: const Color(0xff451c16),//70%
      700: const Color(0xff2e130e),//80%
      800: const Color(0xff170907),//90%
      900: const Color(0xff000000),//100%
    },
  );
}