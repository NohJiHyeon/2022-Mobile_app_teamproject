import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:scan/scan.dart';
import 'package:flutter/services.dart';
import 'package:w3_class/components/calendar_button.dart';

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
  final _controller = TextEditingController();
  String _platformVersion = 'Unknown';
  String qrcode = 'Unknown';
  String brand = '';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지에서 바코드 스캔'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(imageFile),
              // Text('Running on: $_platformVersion\n'),
              Wrap(
                children: [
                  ElevatedButton(
                    child: const Text("이미지에서 바코드 스캔하기", style: TextStyle(fontSize: 18),),
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
              SizedBox(
                height: 20,
              ),
              Text('바코드 번호 : $qrcode', style: TextStyle(fontSize: 18),),
              SizedBox(
                height: 20,
              ),
              CalendarButton(300, 50),
            ],
          ),
        ],
      ),
    );
  }
}
