import 'package:flutter/material.dart';
import '../styles.dart';
import '../components/gifticon_stack.dart';
import 'barcode_image_generation.dart';

class BrandeDetailPage extends StatefulWidget {
  const BrandeDetailPage({Key? key}) : super(key: key);

  @override
  State<BrandeDetailPage> createState() => _BrandeDetailPageState();
}

class _BrandeDetailPageState extends State<BrandeDetailPage> {
  final items = List.generate(100, (i) => i).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Tab(
        // brand Tab
        child: SizedBox(
          height: double.infinity,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.all(29.0),
                child: Image.asset(
                  'lib/images/starbucks.png',
                  height: 34,
                  width: 332,
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(bottom: 29),
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 29.0),
                // child: Image.asset(
                //   'lib/images/barcode_example.png',
                //   width: 347,
                //   height: 92,
                // ),
                child: BarcodeImage('1234567890247389234789'),
              ),
              // SizedBox(
              //   height: 500,
              //   child: GridView.count(
              //     crossAxisCount: 2,
              //     children: [
              //       GifticonStackState('lib/images/cat.jpg', '34', context),
              //       GifticonStackState('lib/images/cat.jpg', '56', context),
              //       GifticonStackState('lib/images/cat.jpg', '90', context),
              //       GifticonStackState('lib/images/cat.jpg', '34', context),
              //       GifticonStackState('lib/images/cat.jpg', '34', context),
              //       GifticonStackState('lib/images/cat.jpg', '34', context),
              //       GifticonStackState('lib/images/cat.jpg', '34', context),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
