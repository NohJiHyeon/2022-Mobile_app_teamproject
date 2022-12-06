import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

/*
  parameter로 data 넣으면 바코드 위젯을 반환하는 메소드
 */

class BarcodeImage extends StatelessWidget {
  BarcodeImage(this.dataStr);
  final String dataStr;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/barcode', arguments: BarcodeWidget(
          barcode: Barcode.code128(escapes: true), // 바코드 타입 지정
          data: dataStr,
        ),);
      },
      child: Container(
        child: BarcodeWidget(
          barcode: Barcode.code128(escapes: true), // 바코드 타입 지정
          data: dataStr,
          width: 347,
          height: 92,
        ),
      ),
    );
  }
}


