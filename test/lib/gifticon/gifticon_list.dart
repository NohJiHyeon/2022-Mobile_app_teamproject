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

  // Bottom Navigation Bar onTap 함수
  void naviTapped(int index) {
    setState(() {
      _bottomNaviIndex = index;
    });
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
          if (sortOption == 'EXPIRATION') {
            if (data != null) {
              data.sort((e1, e2) {
                return e1['expiration_date'].compareTo(e2['expiration_date']);
              });
            }
          } else {
            if (data != null) {
              data.sort((e1, e2) {
                return e1['created_date'].compareTo(e2['created_date']);
              });
              // print('스냅샷 ${data.map((i) => i['created_date'])}');
            }
          }
          if (_bottomNaviIndex == 0) {
            data = data.where((i) => i['canUse'] == true).toList();
          } else {
            data = snapshot!.data!.where((i) => i['canUse'] == false).toList();
          }

          return Scaffold(
              body: RefreshIndicator(
                onRefresh: _onRefresh,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _bottomNaviIndex == 0
                              ? ElevatedButton(
                                  onPressed: () {
                                    sortOption == 'EXPIRATION'
                                        ? data = [...snapshot!.data!]
                                        : data!.sort((e1, e2) {
                                            return e1['expiration_date']
                                                .compareTo(
                                                    e2['expiration_date']);
                                          });
                                    sortOption == 'EXPIRATION'
                                        ? context
                                            .read<SortOption>()
                                            .set_registration_mode()
                                        : context
                                            .read<SortOption>()
                                            .set_expiration_mode();
                                  },
                                  child: Text(sortOption == 'EXPIRATION'
                                      ? '유효기간순'
                                      : '등록순'))
                              : !data.isEmpty
                                  ? ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                    title: const Text('안내'),
                                                    content: const Text(
                                                        '사용된 기프티콘을 모두 삭제합니다.'),
                                                    actions: [
                                                      TextButton(
                                                          child:
                                                              const Text('확인'),
                                                          onPressed: () {
                                                            for (var item
                                                                in data!) {
                                                              gifticonCRUD
                                                                  .delete_gifticon(
                                                                      item[
                                                                          'gifticon_id']);
                                                            }
                                                            setState(() {
                                                              data;
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }),
                                                      TextButton(
                                                          child:
                                                              const Text('취소'),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          })
                                                    ]));
                                      },
                                      child: const Text('일괄 삭제'))
                                  : Container()
                        ]),
                  ),
                  const Divider(color: AppColor.APPBAR_COLOR),
                  Expanded(
                      child: data!.isEmpty
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 80),
                                child: Text(
                                  _bottomNaviIndex == 0
                                      ? '기프티콘을 추가하세요!'
                                      : '사용한 기프티콘이 없습니다.',
                                  style: const TextStyle(
                                      fontSize: 25, color: AppColor.GRAY),
                                ),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 2,
                              children: data!
                                  .map((item) =>
                                      GifticonStackState(item, context))
                                  .toList())),
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
