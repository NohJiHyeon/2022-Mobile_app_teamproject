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

  Future<List<dynamic>> getGifticonList() async {
    final List gifticon_list = await gifticonCRUD.get_gifticon_list();
    return gifticon_list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getGifticonList(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List? data = snapshot.data;
          if (data != null) {
            data.sort((e1, e2) {
              return e1['expiration_date'].compareTo(e2['expiration_date']);
            });
          }

          //print(data);
          var sortOption = context.select((SortOption o) => o.option);
          if (sortOption == 'EXPIRATION') {
            return Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              sortOption == 'EXPIRATION'
                                  ? data!.sort((e1, e2) {
                                      return e1['expiration_date']
                                          .compareTo(e2['expiration_date']);
                                    })
                                  : () {};
                              sortOption == 'EXPIRATION'
                                  ? context
                                      .read<SortOption>()
                                      .set_registration_mode()
                                  : context
                                      .read<SortOption>()
                                      .set_expiration_mode();
                            },
                            child: Text(
                                sortOption == 'EXPIRATION' ? '시간순' : '브랜드순'))
                      ]),
                ),
                const Divider(color: AppColor.APPBAR_COLOR),
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
            );
          }
          // 브랜드별 순
          else {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  ElevatedButton(
                      onPressed: () {
                        sortOption == 'EXPIRATION'
                            ? context.read<SortOption>().set_registration_mode()
                            : context.read<SortOption>().set_expiration_mode();
                      },
                      child: Text(sortOption == 'EXPIRATION' ? '시간순' : '등록순'))
                ]),
              ),
              const Divider(color: AppColor.APPBAR_COLOR),
              Expanded(child: Container()),
            ]);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
