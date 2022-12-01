import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w3_class/gifticon/barcode_scan.dart';
import 'package:w3_class/gifticon/image_picker.dart';
import '../components/brand_add_widget.dart';
import 'package:w3_class/gifticon/barcode_scan.dart';
import 'package:w3_class/gifticon/image_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../components/brand_add_widget.dart';

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
              height: 550,
              child: Builder(
                  builder: (context){
                    switch (brand){
                      case '스타벅스':
                        return const AddStarbucks();
                      case '설빙':
                        return const AddSulbing();
                      case '투썸플레이스':
                        return const AddTwosome();
                      case '공차':
                        return const AddGongcha();
                      case 'CU':
                        return const AddCU();
                      case 'GS25':
                        return const AddGS();
                      case '미니스톱':
                        return const AddMinistop();
                      case '세븐일레븐':
                        return const Add711();
                      case '뚜레쥬르':
                        return const AddTous();
                      case '교촌치킨':
                        return const AddKyochon();
                      case 'BBQ':
                        return const AddBBQ();
                      case '맥도날드':
                        return const AddMcDonalds();
                      case '버거킹':
                        return const AddBurgerKing();
                      case '롯데시네마':
                        return const AddLotteCinema();
                      case 'CGV':
                        return const AddCGV();
                      case '메가박스':
                        return const AddMegabox();
                      case '이디야커피':
                        return const AddEdiya();
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
                onPressed: () {},
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