import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:w3_class/brand/brand_main.dart';
import 'brand/brand_add.dart';
import 'gifticon/barcode_scan.dart';
import 'components/gifticonDetail.dart';
import 'firebase_options.dart';
import 'gifticon/gifticon_add.dart';
import 'styles.dart';
import './auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      home: StreamBuilder(
          // StreamBuilder: firebase에 변화가 생겼을 때 변화를 인지
          stream: FirebaseAuth.instance.authStateChanges(), // 감지할 부분
          builder: (context, snapshot) {
            // snapshot: 변화가 감지됐을 때의 상태
            if (snapshot.hasData) {
              // Data가 있다면 로그인이 된 상태
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: AppColor.APPBAR_COLOR,
                ),
                initialRoute: '/',
                routes: {
                  '/': (context) => BrandMainPage(),
                  '/gifticon_detail': (context) => const GifticonDetail(),
                  '/barcode_scan': (context) => BarcodeScanner(),
                  '/gifticon_add': (context) => GifticonAddPage(),
                  '/brand_add': (context) => BrandAddPage(),
                },
              );
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
