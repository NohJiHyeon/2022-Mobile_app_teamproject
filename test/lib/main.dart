import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:w3_class/brand/brand_main.dart';
import 'brand/brand_add.dart';
import 'components/barcode_scan.dart';
import 'components/gifticonDetail.dart';
import 'firebase_options.dart';
import './components/UploadImage.dart';
import 'gifticon/gifticon_add.dart';
import 'styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColor.APPBAR_COLOR,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BrandMainPage(),
        '/gifticon_detail': (context) => const GifticonDetail(),
        '/barcode_scan': (context) => BarcodeScanner(),
        '/gifticon_add' : (context) => GifticonAddPage(),
        '/brand_add' : (context) => BrandAddPage(),
      },
    );
  }
}