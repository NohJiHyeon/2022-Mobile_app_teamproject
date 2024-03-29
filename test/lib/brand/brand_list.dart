import 'package:flutter/material.dart';
import 'package:w3_class/components/shadowed_brand_icon.dart';
import 'package:w3_class/network/brand_crud.dart';
import 'brand_detail.dart';

class BrandListPage extends StatefulWidget {
  const BrandListPage({Key? key}) : super(key: key);

  @override
  State<BrandListPage> createState() => _BrandListPageState();
}

class _BrandListPageState extends State<BrandListPage> {
  BrandCRUD brandCRUD = BrandCRUD();

  // DB 기프티콘 구하기
  Future<List<dynamic>> getBrandList() async {
    final List brand_list = await brandCRUD.get_brand_list();
    return brand_list;
  }

  Future<void> _onRefresh() {
    setState(() {
      getBrandList();
      print(getBrandList());
      build(context);
    });
    return Future<void>.value();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: getBrandList(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List data = [...snapshot.data!];
            print(data.length);
            if (data.length > 0) {
              return Scaffold(
                body: RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: GridView.builder(
                        itemCount: data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 20,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          return IconButton(
                            icon: ShadowedBrandIcon(data[index]["brand_name"],
                                BrandMainIcon(data[index]["brand_name"])),
                            iconSize: 50,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BrandDetailPage(
                                            brandName: data[index]
                                                ["brand_name"],
                                          )));
                            },
                          );
                        }),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 80),
                  child: Text(
                    '브랜드를 추가하세요!',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

String BrandMainIcon(String brand) {
  String fileType = '';
  switch (brand) {
    case '투썸플레이스':
    case '버거킹':
    case '롯데시네마':
    case '뚜레쥬르':
    case '교촌치킨':
    case '공차':
    case 'CU':
    case '이디야':
      fileType = 'jpg';
      break;
    case '스타벅스':
    case '세븐일레븐':
    case '설빙':
    case '미니스톱':
    case '메가박스':
    case '맥도날드':
    case 'CGV':
    case 'bbq':
    case 'GS25':
      fileType = 'png';
      break;
  }

  return fileType;
}
