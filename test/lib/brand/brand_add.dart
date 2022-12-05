import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w3_class/gifticon/barcode_scan.dart';
import 'package:w3_class/gifticon/image_picker.dart';
import 'brand_add_widget.dart';
import 'package:w3_class/gifticon/barcode_scan.dart';
import 'package:w3_class/gifticon/image_picker.dart';

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
  final _brandList = [
    '스타벅스',
    '투썸플레이스',
    '이디야커피',
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
                        return const AddSulbing();
                      case '투썸플레이스':
                        return ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Image.asset('lib/images/투썸 헤더.jpg', width: 700),
                            const SizedBox(
                              height: 20,
                            ),
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
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Image.asset('lib/images/GS25 헤더.png', width: 700),
                              const SizedBox(
                                height: 20,
                              ),
                              AddKTMembership('GS25'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddUPlusMembership('GS25'),
                            ]
                        );
                      case '미니스톱':
                        return AddOKMembership('Ministop');
                      case '세븐일레븐':
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Image.asset('lib/images/세븐일레븐 헤더.jpg', width: 700),
                              const SizedBox(
                                height: 20,
                              ),
                              AddTMembership('세븐일레븐'),
                              const SizedBox(
                                height: 20,
                              ),
                              AddLPointMembership('세븐일레븐'),
                            ]
                        );
                      case '뚜레쥬르':
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Image.asset('lib/images/뚜레쥬르 헤더.jpg', width: 700),
                              const SizedBox(
                                height: 20,
                              ),
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
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Image.asset('lib/images/롯데시네마 헤더.jpg', width: 700),
                              const SizedBox(
                                height: 20,
                              ),
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
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Image.asset('lib/images/cgv 헤더.png', width: 700),
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
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Image.asset('lib/images/메가박스 헤더.jpg', width: 700),
                              const SizedBox(
                                height: 20,
                              ),
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
                  '등록',
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}