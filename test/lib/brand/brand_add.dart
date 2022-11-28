import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    'BHC',
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
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: '브랜드명',
              ),
              items: List.generate(_brandList.length, (i) {
                return DropdownMenuItem(
                    value: _brandList[i], child: Text(_brandList[i]));
              }),
              onChanged: (value) {
                print(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('멤버십 바코드 이미지'),
            const SizedBox(
              height: 20,
            ),
            ImagePick(),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '바코드',
              ),
              onChanged: (value) {},
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
