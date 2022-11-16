import 'package:flutter/material.dart';
import 'package:w3_class/gifticon/gifticon_add.dart';
import './styles.dart';
import 'package:w3_class/brand/brand_main.dart';
import './components/shadowed_brand_icon.dart';
import 'package:w3_class/gifticon/gifticonDetail.dart';
import 'package:w3_class/brand/brand_detail.dart';
import 'package:w3_class/gifticon/gifticon_list.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:w3_class/components/image_picker.dart';
import 'package:w3_class/components/barcode_scan.dart';
import 'package:w3_class/components/custom_floatingActionButton.dart';

// BrandMainPage -> 브랜드 메인 페이지 -> 플로팅 버튼 -> 브랜드 생성 페이지, 기프티콘 생성 페이지
// BrandDetailPage -> 브랜드 상세 페이지
// GifticonListPage -> 기프티콘 목록 페이지 -> 플로팅 버튼 -> GifticonDetail
// GifticonDetail -> 기프티콘 상세 페이지
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: AppColor.APPBAR_COLOR),
      // home: const ImagePick(),
      initialRoute: '/',
      routes: {
        '/': (context) => const BrandMainPage(),
        '/gifticon_detail': (context) => const GifticonDetail(),
        '/barcode_scan': (context) => BarcodeScanner(),
        '/gifticon_add' : (context) => GifticonAddPage(),
      },
    );
  }
}
