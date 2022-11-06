import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:scan/scan.dart';
import 'package:flutter/services.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지에서 바코드 스캔'),
      ),
      body: Column(
        children: [
          // Text('Running on: $_platformVersion\n'),
          Wrap(
            children: [
              ElevatedButton(
                child: const Text("이미지에서 바코드 스캔하기"),
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
          Text('scan result is $qrcode'),
        ],
      ),
    );
  }
}
