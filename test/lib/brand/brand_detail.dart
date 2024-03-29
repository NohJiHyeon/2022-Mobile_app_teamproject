import 'package:flutter/material.dart';
import '../network/brand_crud.dart';
import '../network/gifticon_crud.dart';
import 'brand_detail_widget.dart';

class BrandDetailPage extends StatefulWidget {
  const BrandDetailPage({Key? key, required this.brandName}) : super(key: key);
  final String brandName;

  @override
  State<BrandDetailPage> createState() => _BrandDetailPageState();
}

class _BrandDetailPageState extends State<BrandDetailPage> {
  @override
  Widget build(BuildContext context) {
    // const brandName = '투썸플레이스';
    final String brandName = widget.brandName;

    return FutureBuilder(
      future: Future.wait([
        getBrandData(brandName),
        getGifticonData(brandName),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          final brandData = snapshot.data![0];
          List gifticonData = snapshot.data![1];
          return BrandDetailWidget(brandData, gifticonData!, brandName);
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

  Future getBrandData(String brand) async {
    // DB 데이터 읽어오기
    final brandCRUD = BrandCRUD();
    final brand_data = await brandCRUD.get_brand_info(brand);
    return brand_data;
  }

  Future getGifticonData(String brand) async {
    // DB 데이터 읽어오기
    final gifticonCRUDcrud = GifticonCRUD();
    final gifticon_data = await gifticonCRUDcrud.get_brand_gifticon_list(brand);
    return gifticon_data;
  }
}
