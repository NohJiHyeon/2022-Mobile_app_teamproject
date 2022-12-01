import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:scan/scan.dart';
import 'package:flutter/services.dart';
import '../components/calendar_button.dart';
import '../network/gifticon_crud.dart';
import 'package:provider/provider.dart';
import '../provider/date_provider.dart';

/*
  argument로 이미지 파일을 넣으면 이미지에서 바코드를 읽어오는 위젯입니다.
  사용 방법: image_picker에서 선택한 사진을 argument로 넘기기
  '이미지에서 바코드 스캔하기' 버튼을 누르면 스캔한 결과가 화면에 나타납니다.
 */

class BarcodeScanner extends StatefulWidget {

  @override
  _BarcodeScanner createState() => _BarcodeScanner();
}

class _BarcodeScanner extends State<BarcodeScanner> {
  String _platformVersion = 'Unknown';
  String qrcode = 'Unknown';



  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageFile = ModalRoute.of(context)?.settings.arguments as File;
    final GifticonCRUD crud = GifticonCRUD();
    final _controller = TextEditingController();
    final _brandcontroller = TextEditingController();
    String gifticon_name = '';
    String brand = '';

    return ChangeNotifierProvider(
      create: (BuildContext context) => Date(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('이미지에서 바코드 스캔'),
        ),
        body: SizedBox(
          height: double.infinity,
          child: ListView(
            children: [
              Image.file(imageFile),
              // Text('Running on: $_platformVersion\n'),
              Center(
                child: Wrap(
                  children: [
                    ElevatedButton(
                      child: const Text(
                        "이미지에서 바코드 스캔하기",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () async {
                        String? str = await Scan.parse(imageFile!.path);
                        if (str != null) {
                          setState(() {
                            qrcode = str;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  '바코드 번호 : $qrcode',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CalendarButton(300, 50),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("상품명 : ", style: TextStyle(fontSize: 18),),
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      gifticon_name = value;
                    },
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("브랜드명 : ", style: TextStyle(fontSize: 18),),
                  Expanded(
                      child: TextField(
                    controller: _brandcontroller,
                    onChanged: (value) {
                      brand = value;
                    },
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                     crud.add_gifticon(gifticon_name, brand, context.read<Date>().expDate, imageFile, qrcode);
                  },
                  child: Text("등록"))
            ],
          ),
        ),
      ),
    );
  }
}
