import 'package:flutter/material.dart';
import 'barcode_image_generation.dart';
import 'package:w3_class/styles.dart';
import '../components/gifticon_stack.dart';
import '../network/gifticon_crud.dart';

class BrandDetailWidget extends StatelessWidget {
  BrandDetailWidget(this.brandData, this.gifticonData, this.brand_name); // 생성자
  final List gifticonData;
  var brandData;
  final String brand_name;
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
    // print(gifticonData);
    // print(brandData['brand_barcode'] != null ? "null아님" : "null임");
    final discount_list = brandData['discount_list'];
    final membership_list = brandData['membership_list'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('lib/images/Brandicon.png'),
        actions: [
          IconButton(
              onPressed: () {
                GifticonCRUD().logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          /*
          브랜드 이미지, 바코드
           */
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Image.asset(
              'lib/images/${_brand_image_path[brand_name]}',
              height: 80,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 29.0),
            child: brandData['brand_barcode'] != null
                ? BarcodeImage(brandData['brand_barcode'])
                : Container(),
          ),
          /*
          바코드 리스트
           */
          barcodeListWidget('할인 바코드', discount_list),
          barcodeListWidget('적립 바코드', membership_list),
          const SizedBox(
            height: 20,
          ),
          /*
          브랜드에 등록된 기프티콘 리스트
           */
          SizedBox(
            height: 500,
            child: GridView.count(
              crossAxisCount: 2,
              children: gifticonData
                  .map((item) => GifticonStackState(item, context))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget barcodeListWidget(String listName, List barcodeList) {
    print(barcodeList);
    if (barcodeList == null) {
      return Container();
    }
    return Column(
      children: [
        // 리스트 이름
        Align(
          alignment: Alignment.center,
          child: Text(
            listName,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 5.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: listName == '할인 바코드' ? AppColor.GRAY : AppColor.ORANGE,
                  width: 2.5),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 20.0, top: 5.0),
              child: Column(
                children: [
                  for (var i = 0; i < barcodeList.length; i++)
                    Column(
                      children: [
                        Image.asset(
                          'lib/images/${_brand_image_path[barcodeList[i]['brand_name']]}',
                          height: 34,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BarcodeImage('2390809809842342'),
                        if (i != barcodeList.length - 1)
                          const SizedBox(
                            height: 20,
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
