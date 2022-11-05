import 'package:flutter/material.dart';
import './styles.dart';
import 'package:w3_class/gifticon/gifticonDetail.dart';
import 'package:w3_class/brand/brand_detail.dart';
import 'package:w3_class/gifticon/gifticon_list.dart';

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
      home: const GifticonListPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return GifticonDetail();
    return const BrandeDetailPage();
  }
}
