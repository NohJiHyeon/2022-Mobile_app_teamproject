import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w3_class/main.dart';
import 'package:w3_class/network/brand_crud.dart';

/*
  버튼을 누르면 휴대폰 갤러리로 이동 -> 갤러리에서 사진 선택 -> 다음 페이지로 넘어가는 위젯입니다.
  ElevatedButton을 반환합니다.
  선택한 사진은 argument로 전달됩니다.
 */
class BrandImagePick extends StatefulWidget {
  String brand = "";
  String discount = "";
  BrandImagePick(this.brand,this.discount);
  @override
  State<BrandImagePick> createState() => BrandImagePickState(brand,discount);
}

class BrandImagePickState extends State<BrandImagePick> {
  final user = BrandCRUD();
  File? _image; // 갤러리에서 들고온 이미지 파일
  String brand = "";
  String discount = "";
  String barcode = "";
  BrandImagePickState(this.brand,this.discount);
  final picker = ImagePicker(); // 이미지 가져오는 ImagePicker


  // 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource, String nextPage) async {
    final image = await picker.pickImage(source: imageSource);
    final result = await Navigator.pushNamed(context, '/brand_barcode_scan',
        arguments: File(image!.path)) as String; // argument로 이미지 전달

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
      barcode = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // 갤러리에서 이미지를 가져오는 버튼
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.gallery, '/brand_barcode_scan');
          },
          child: const Icon(Icons.wallpaper),
        ),
        Center(
          child: Text(
            '바코드 번호 : $barcode',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
          child: const Text(
            "등록하기",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () async {
           user.add_membership_brand(brand, discount, '123456');
          },
        ),
      ],
    );
  }
}
