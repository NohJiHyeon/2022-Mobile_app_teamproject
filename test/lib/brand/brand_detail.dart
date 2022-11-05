import 'package:flutter/material.dart';
import '../styles.dart';
import '../base/gifticon_stack.dart';

class BrandeDetailPage extends StatefulWidget {
  const BrandeDetailPage({Key? key}) : super(key: key);

  @override
  State<BrandeDetailPage> createState() => _BrandeDetailPageState();
}

class _BrandeDetailPageState extends State<BrandeDetailPage> {
  final items = List.generate(100, (i) => i).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: '브랜드',
              ),
              Tab(
                text: '기프티콘',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
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
                      padding: const EdgeInsets.only(bottom: 29),
                      child: Image.asset(
                        'lib/images/barcode_example.png',
                        width: 347,
                        height: 92,
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: [
                          GifticonStackState('lib/images/cat.jpg', '34'),
                          GifticonStackState('lib/images/cat.jpg', '56'),
                          GifticonStackState('lib/images/cat.jpg', '90'),
                          GifticonStackState('lib/images/cat.jpg', '34'),
                          GifticonStackState('lib/images/cat.jpg', '34'),
                          GifticonStackState('lib/images/cat.jpg', '34'),
                          GifticonStackState('lib/images/cat.jpg', '34'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Tab(
              child: Center(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: AppColor.GRAY,
        ),
      ),
    );
  }
}
