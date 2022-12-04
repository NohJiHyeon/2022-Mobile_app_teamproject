import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../styles.dart';
import '../components/gifticon_stack.dart';
import '../network/gifticon_crud.dart';
import '../provider/sort_provider.dart';
import 'dart:async';

class GifticonListPage extends StatefulWidget {
  const GifticonListPage({Key? key}) : super(key: key);

  @override
  State<GifticonListPage> createState() => _GifticonListPageState();
}

class _GifticonListPageState extends State<GifticonListPage> {
  final GifticonCRUD gifticonCRUD = GifticonCRUD();
  int _bottomNaviIndex = 0;

  // DB 기프티콘 구하기
  Future<List<dynamic>> getGifticonList() async {
    final List gifticon_list = await gifticonCRUD.get_gifticon_list();
    return gifticon_list;
  }

  Future<void> _onRefresh() {
    setState(() {
      getGifticonList();
      build(context);
    });
    return Future<void>.value();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getGifticonList(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          // 깊은 복사
          List? data = [...snapshot!.data!];

          //print(data);
          var sortOption = context.select((SortOption o) => o.option);
          if (sortOption == 'TIME') {
            return Scaffold(
              body: RefreshIndicator(
                onRefresh: _onRefresh,
                child: Column(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                sortOption == 'TIME'
                                    ? data!.sort((e1, e2) {
                                        return e1['expiration_date']
                                            .compareTo(e2['expiration_date']);
                                      })
                                    : () {};
                                sortOption == 'TIME'
                                    ? context.read<SortOption>().set_brand_mode()
                                    : context.read<SortOption>().set_time_mode();
                              },
                              child: Text(sortOption == 'TIME' ? '시간순' : '브랜드순'))
                        ]),
                  ),
                  Expanded(
                      child: data!.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 80),
                                child: Text(
                                  '기프티콘을 추가하세요!',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 2,
                              children: data!
                                  .map(
                                      (item) => GifticonStackState(item, context))
                                  .toList())),
                ]),
              ),
              bottomNavigationBar: BottomNavigationBar(
              items: [
              const BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_sharp), label: '사용 전'),
              const BottomNavigationBarItem(icon: Icon(Icons.done), label: '사용 완료'),
              ],
              )
            );
          }
          // 브랜드별 순
          else {
            return Scaffold(
              body: RefreshIndicator(
                onRefresh: _onRefresh,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      ElevatedButton(
                          onPressed: () {
                            sortOption == 'TIME'
                                ? context.read<SortOption>().set_brand_mode()
                                : context.read<SortOption>().set_time_mode();
                          },
                          child: Text(sortOption == 'TIME' ? '시간순' : '브랜드순'))
                    ]),
                  ),
                  Expanded(child: Container()),
                ]),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard_sharp), label: '사용 전'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.done), label: '사용 완료'),
                ],
                currentIndex: _bottomNaviIndex,
                selectedItemColor: AppColor.APPBAR_COLOR,
                onTap: naviTapped,
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
