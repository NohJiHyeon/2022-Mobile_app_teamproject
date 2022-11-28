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
    return Tab(
      // gifticon Tab
      child: Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            children: items
                .map((i) => GifticonStackState('lib/images/cat.jpg', '$i', context))
                .toList()),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.photo), label: '사용 전'),
            const BottomNavigationBarItem(icon: Icon(Icons.done), label: '사용 완료'),
          ],
        ),
      ),
    );
  }
}
