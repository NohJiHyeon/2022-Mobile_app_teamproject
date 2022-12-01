import 'dart:io';
import 'package:flutter/material.dart';
import 'brand_crud.dart';
import 'gifticon_crud.dart';

/*
  CRUD 메소드 테스트용 페이지입니다.
  자세한 사용 방법은 노션 회의록>firebase 진행상황에 적어두었습니다.
 */

class CRUDTestPage extends StatefulWidget {
  CRUDTestPage({Key? key}) : super(key: key);

  @override
  State<CRUDTestPage> createState() => _CRUDTestPageState();
}

class _CRUDTestPageState extends State<CRUDTestPage> {
  final GifticonCRUD gifticonCRUD = GifticonCRUD();
  final BrandCRUD brandCRUD = BrandCRUD();

  // File imageFile = File('lib/images/cat.jpg');
  // example image
  @override
  Widget build(BuildContext context) {
    final imageFile = ModalRoute.of(context)?.settings.arguments as File;
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              gifticonCRUD.logout();
            },
            child: const Text("로그아웃")),
        ElevatedButton(
            onPressed: () {
              // gifticonCRUD.add_gifticon(
              // "아메리카노 Tall", "스타벅스", 2023, 10, 10, imageFile);
              DateTime dateTime = DateTime(2022, 11, 30, 23, 59, 59);
              print(dateTime.year);
              print(dateTime.month);
              print(dateTime.day);
            },
            child: const Text("기프티콘 추가")),
        ElevatedButton(
            onPressed: () async {
              final dDay = await gifticonCRUD.get_gifticon_dDay("gifticon 3");
              print(dDay);
            },
            child: const Text("디데이 읽어오기")),
        ElevatedButton(
            onPressed: () async {
              final data = await gifticonCRUD.get_gifticon("gifticon 3");
              print(data);
            },
            child: const Text("기프티콘 정보 읽어오기")),
        ElevatedButton(
            onPressed: () async {
              final data = await gifticonCRUD.get_gifticon_list();
              print(data);
            },
            child: const Text("기프티콘 리스트 읽어오기")),
        ElevatedButton(
            onPressed: () async {
              final data = await gifticonCRUD.get_brand_gifticon_list("brand");
              print(data);
            },
            child: const Text("브랜드의 기프티콘 리스트 읽어오기")),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () async {
              brandCRUD.add_brand("투썸", "456");
            },
            child: const Text("브랜드 추가")),
        ElevatedButton(
            onPressed: () async {
              brandCRUD.add_discount_brand("투썸2", "땡떙멤버쉽", "238049");
            },
            child: const Text("할인 브랜드 추가")),
        ElevatedButton(
            onPressed: () async {
              brandCRUD.add_membership_brand("투썸", "QQ멤버쉽", "489305");
            },
            child: const Text("멤버쉽 브랜드 추가")),
        ElevatedButton(
            onPressed: () async {
              final data = await brandCRUD.get_brand_list();
              print(data);
            },
            child: const Text("멤버쉽 리스트 읽어오기")),
      ],
    );
  }
}
