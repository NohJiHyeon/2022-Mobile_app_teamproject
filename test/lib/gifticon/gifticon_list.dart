import 'package:flutter/material.dart';
import '../styles.dart';
import '../components/gifticon_stack.dart';

class GifticonListPage extends StatefulWidget {
  const GifticonListPage({Key? key}) : super(key: key);

  @override
  State<GifticonListPage> createState() => _GifticonListPageState();
}

class _GifticonListPageState extends State<GifticonListPage> {
  final items = List.generate(20, (i) => i).toList();
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
            const Tab(
              child: Center(),
            ),
            Tab(
              // gifticon Tab
              child: GridView.count(
                  crossAxisCount: 2,
                  children: items
                      .map(
                        (i) => GifticonStackState('lib/images/cat.jpg', '$i'),
                      )
                      .toList()),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.GRAY,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
