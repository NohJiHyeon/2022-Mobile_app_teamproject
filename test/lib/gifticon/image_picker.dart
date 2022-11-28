import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w3_class/main.dart';

/*
  버튼을 누르면 휴대폰 갤러리로 이동 -> 갤러리에서 사진 선택 -> 다음 페이지로 넘어가는 위젯입니다.
  ElevatedButton을 반환합니다.
  선택한 사진은 argument로 전달됩니다.
 */

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => ImagePickState();
}

class ImagePickState extends State<ImagePick> {
  File? _image; // 갤러리에서 들고온 이미지 파일
  final picker = ImagePicker(); // 이미지 가져오는 ImagePicker

  // 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource, String nextPage) async {
    final image = await picker.pickImage(source: imageSource);
    Navigator.pushNamed(context, '/crud_test_page',
        arguments: File(image!.path)); // argument로 이미지 전달

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // 갤러리에서 이미지를 가져오는 버튼
    return ElevatedButton(
      onPressed: () {
        getImage(ImageSource.gallery, '/barcode_scan');
      },
      child: const Icon(Icons.wallpaper),
    );
  }
}
