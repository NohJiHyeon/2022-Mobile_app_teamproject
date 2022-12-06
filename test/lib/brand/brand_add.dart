import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w3_class/gifticon/barcode_scan.dart';
import 'package:w3_class/gifticon/image_picker.dart';
import 'brand_add_widget.dart';
import 'package:w3_class/gifticon/barcode_scan.dart';
import 'package:w3_class/gifticon/image_picker.dart';
import 'package:w3_class/network/brand_crud.dart';

class BrandAddPage extends StatelessWidget {
  const BrandAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('브랜드 등록하기'),
      ),
      body: const BrandAddForm(),
    );
  }
}

class BrandAddForm extends StatefulWidget {
  const BrandAddForm({Key? key}) : super(key: key);

  @override
  State<BrandAddForm> createState() => _BrandAddFormState();
}

class _BrandAddFormState extends State<BrandAddForm> {
  final _formkey = GlobalKey<FormState>();
  String? brand = '';
  final user = BrandCRUD();
  final _brandList = [
    '스타벅스',
    '투썸플레이스',
    '이디야',
    '설빙',
    '공차',
    'CU',
    'GS25',
    '미니스톱',
    '세븐일레븐',
    '뚜레쥬르',
    '교촌치킨',
    'BBQ',
    '맥도날드',
    '버거킹',
    '롯데시네마',
    'CGV',
    '메가박스'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formkey,
        child: ListView(
          children:[
            DropdownButtonFormField<String>(
              decoration:  InputDecoration(
                labelText: '브랜드명',
              ),
              items: _brandList.map((brand) => DropdownMenuItem(
                value: brand,
                child: Text(brand),
              )).toList(),
              onChanged: (val) {
                setState(() {
                  brand = val;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 430,
              child: Builder(
                  builder: (context){
                    switch (brand){
                      case '스타벅스':
                        return ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            const AddStarbucks(),
                            const SizedBox(
                              height: 20,
                            ),
                            AddKTMembership('스타벅스'),
                          ],
                        );

                      case '설빙':
                        user.add_brand_without_barcode('설빙');
                        return const AddSulbing();
                      case '투썸플레이스':
                        user.add_brand_without_barcode('투썸플레이스');
                        return ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            AddCJOneMembership('투썸플레이스'),
                            const SizedBox(
                              height: 20,
                            ),
                            AddTMembership('투썸플레이스'),
                            const SizedBox(
                              height: 20,
                            ),
                            AddKTMembership('투썸플레이스'),
                            const SizedBox(
                              height: 20,
                            ),
                            AddUPlusMembership('투썸플레이스'),
                          ],
                        );
                      case '공차':
                        user.add_brand_without_barcode('공차');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddGongcha(),
                              const SizedBox(
                                height: 20,
                              ),
                              AddTMembership('공차'),
                            ]
                        );
                      case 'CU':
                        user.add_brand_without_barcode('CU');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddCU(),
                              const SizedBox(
                                height: 20,
                              ),
                              AddTMembership('CU'),
                            ]
                        );
                      case 'GS25':
                        user.add_brand_without_barcode('GS25');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddKTMembership('GS25'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddUPlusMembership('GS25'),
                            ]
                        );
                      case '미니스톱':
                        user.add_brand_without_barcode('미니스톱');
                        return AddOKMembership('미니스톱');
                      case '세븐일레븐':
                        user.add_brand_without_barcode('세븐일레븐');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddTMembership('세븐일레븐'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddLPointMembership('세븐일레븐'),
                            ]
                        );
                      case '뚜레쥬르':
                        user.add_brand_without_barcode('뚜레쥬르');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddCJOneMembership('뚜레쥬르'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddTMembership('뚜레쥬르'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddKTMembership('뚜레쥬르'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddUPlusMembership('뚜레쥬르'),
                            ]
                        );
                      case '이디야커피':
                        return const AddEdiya();
                      case 'BBQ':
                        return const AddBBQ();
                      case '교촌치킨':
                        return const AddKyochon();
                      case '맥도날드':
                        return const AddMcDonalds();
                      case '버거킹':
                        return const AddBurgerKing();
                      case '롯데시네마':
                        user.add_brand_without_barcode('롯데시네마');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddTMembership('롯데시네마'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddKTMembership('롯데시네마'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddOKMembership('롯데시네마'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddKiaMembership('롯데시네마'),
                            ]
                        );
                      case 'CGV':
                        user.add_brand_without_barcode('CGV');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddCJOneMembership('CGV'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddKTMembership('CGV'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddUPlusMembership('CGV'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddOKMembership('CGV'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddKiaMembership('CGV'),
                            ]
                        );
                      case '메가박스':
                        user.add_brand_without_barcode('메가박스');
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              AddKTMembership('메가박스'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddUPlusMembership('메가박스'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddOKMembership('메가박스'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddLPointMembership('메가박스'),
                            ]
                        );
                      default:
                        return Text('브랜드를 선택해주세요');
                    }
                  }
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '완료',
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}