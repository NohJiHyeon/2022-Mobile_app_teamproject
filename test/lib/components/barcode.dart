import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';


//바코드 확대 화면
class BarcodePage extends StatefulWidget {
  const BarcodePage({Key? key}) : super(key: key);

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {

  @override
  Widget build(BuildContext context) {
    final barcode = ModalRoute.of(context)?.settings.arguments as BarcodeWidget;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Container(
                    child: barcode,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
