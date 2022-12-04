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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: brandCRUD.get_brand(),
      builder: (context,snapshot){
        if (snapshot.hasData){
         // List data = snapshot.data!.toList();
          List data = ['스타벅스','맥도날드'];
          return Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
                itemCount: data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index){
                  return IconButton(
                    icon: ShadowedBrandIcon(data[index], BrandMainIcon(data[index])),
                    iconSize: 50,
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BrandDetailPage(brandName: data[index],)));
                    },
                  );;
                }
            ),
          );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}

String BrandMainIcon(String brand){
  String fileType = '';
  switch(brand){
    case '투썸플레이스':
    case '버거킹':
    case '롯데시네마':
    case '뚜레쥬르':
    case '교촌치킨':
    case '공차':
    case '씨유':
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
      fileType = 'png';
      break;
  }

  return fileType;
}




