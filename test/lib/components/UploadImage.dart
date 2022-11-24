import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploadTest extends StatefulWidget {
  const ImageUploadTest({Key? key}) : super(key: key);

  @override
  State<ImageUploadTest> createState() => _ImageUploadTestState();
}

class _ImageUploadTestState extends State<ImageUploadTest> {
  late File _image;
  final picker = ImagePicker();
  String imageURL = 'https://i.imgur.com/sUFH1Aq.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          ElevatedButton(
              onPressed: () {
                _getImage();
              },
              child: const Text("업로드")),
          Container(
            child: (imageURL != null)
                ? Image.network(imageURL)
                : Image.network('https://i.imgur.com/sUFH1Aq.png'),
          )
        ],
      ),
    );
  }

  Future _getImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    print("storage 이름: " + _firebaseStorage.toString());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    _image = File(pickedFile!.path);
    print("선택한 이미지: ${pickedFile!.path}");

    if (_image != null) {
      // Firebase에 업로드
      print("업로드 시작");
      var snapshot = await _firebaseStorage
          .ref() // 시작점
          .child('test') // collection 이름
          .putFile(_image) // 실제 이미지 파일, 버전 7 이상에서는 onComplete 필요 없음
          .whenComplete(() => print("업로드 완료"));

      print("업로드 끝");
      if (snapshot.state == TaskState.success) {
        print("ulr 찾기");
        var downloadURL = await snapshot.ref.getDownloadURL();
        setState(() {
          imageURL = downloadURL;
        });
      } else {
        print("업로드 되지 않았음");
      }
    } else {
      print('업로드 실패');
    }
  }
}
