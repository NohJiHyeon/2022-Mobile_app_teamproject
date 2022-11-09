import 'package:flutter/material.dart';
import './styles.dart';
import 'package:w3_class/brand/brand_main.dart';
import 'package:w3_class/gifticon/gifticonDetail.dart';
import 'package:w3_class/brand/brand_detail.dart';
import 'package:w3_class/gifticon/gifticon_list.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:w3_class/components/image_picker.dart';
import 'package:w3_class/components/barcode_scan.dart';
import 'package:w3_class/components/custom_floatingActionButton.dart';

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
        '/': (context) => const ImagePick(),
        '/barcode_scan': (context) => BarcodeScanner(),
      },
    );
  }
}
