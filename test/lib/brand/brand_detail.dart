import 'package:flutter/material.dart';
import 'barcode_image_generation.dart';
import 'package:w3_class/styles.dart';
import '../network/brand_crud.dart';
import '../components/gifticon_stack.dart';
import '../network/gifticon_crud.dart';

class BrandeDetailPage extends StatefulWidget {
  const BrandeDetailPage({Key? key}) : super(key: key);

  @override
  State<BrandeDetailPage> createState() => _BrandeDetailPageState();
}

class _BrandeDetailPageState extends State<BrandeDetailPage> {
  @override
  Widget build(BuildContext context) {
    // final brand = ModalRoute.of(context)!.settings.arguments as Map;
    final brand_name = '스타벅스';

    return FutureBuilder(
      future: Future.wait([
        getBrandData(),
        getGifticonData(brand_name),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List? brandData = snapshot.data![0];
          List? gifticonData = snapshot.data![1];
          // return Scaffold();
          return BrandDetailWidget(brandData!, gifticonData!, brand_name);
        } else {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<List<dynamic>> getBrandData() async {
    // DB 데이터 읽어오기
    final brandCRUD = BrandCRUD();
    final brand_data = await brandCRUD.get_brand_list();
    return brand_data;
  }

  Future<List<dynamic>> getGifticonData(String brand) async {
    // DB 데이터 읽어오기
    final gifticonCRUDcrud = GifticonCRUD();
    final gifticon_data = await gifticonCRUDcrud.get_brand_gifticon_list(brand);
    return gifticon_data;
  }
}

class BrandDetailWidget extends StatelessWidget {
  final List gifticonData;
  final List brandData;
  final String brand_name;
  BrandDetailWidget(this.brandData, this.gifticonData, this.brand_name); // 생성자
  final _brand_image_path = {
    '스타벅스': '스타벅스 헤더.jpg',
    '투썸플레이스': '투썸 헤더.jpg',
    '이디야커피': '이디야 헤더.jpg',
    '설빙': '설빙 헤더.jpg',
    '공차': '공차 헤더.jpg',
    'CU': 'CU 헤더.jpg',
    'GS25': 'GS25 헤더.png',
    '미니스톱': '미니스톱 헤더.png',
    '세븐일레븐': '세븐일레븐 헤더.jpg',
    '뚜레쥬르': '뚜레쥬르 헤더.jpg',
    '교촌치킨': '교촌치킨 헤더.png',
    'BHC': 'bhc 헤더.jpg',
    'BBQ': 'bbq 헤더.jpg',
    '맥도날드': '맥도날드 헤더.jpg',
    '버거킹': '버거킹 헤더.jpg',
    '롯데시네마': '롯데시네마 헤더.jpg',
    'CGV': 'cgv 헤더.png',
    '메가박스': '메가박스 헤더.jpg',
    'CJ ONE': 'CJ ONE 헤더.jpg',
    'T': 'T  헤더.png',
    'kt': 'kt 헤더.jpg',
    'U+': 'U+ 헤더.jpg',
    '기아멤버스': '기아멤버스 헤더.png',
    'OK캐쉬백': 'OK캐쉬백 헤더.png',
    'L Point': 'L Point 헤더.png',
  };

  @override
  Widget build(BuildContext context) {
    print(gifticonData);
    print(brandData);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Image.asset(
              'lib/images/${_brand_image_path[brand_name]}',
              height: 34,
              width: 1032,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 29.0),
            child: BarcodeImage('1234567890247389234789'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColor.GRAY_WITH_OPACITY, width: 3.5),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              height: 300,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/images/${_brand_image_path[brand_name]}',
                      height: 34,
                      width: 1032,
                    ),
                    BarcodeImage('2390809809842342'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppColor.GRAY_WITH_OPACITY, width: 3.5),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
// height: 300,
// width: 300,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
// Image.asset(
// 'lib/images/${_brand_image_path[brand]}',
// height: 34,
// width: 1032,
// ),
                    BarcodeImage('2390809809842342'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                GifticonStackState(gifticonData[0], context),
                GifticonStackState(gifticonData[0], context),
                GifticonStackState(gifticonData[0], context),
                GifticonStackState(gifticonData[0], context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
