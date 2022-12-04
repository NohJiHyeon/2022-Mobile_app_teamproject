import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w3_class/gifticon/barcode_scan.dart';
import 'package:w3_class/components/calendar_button.dart';
import 'package:w3_class/gifticon/image_picker.dart';

class GifticonAddPage extends StatelessWidget {
  const GifticonAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기프티콘 등록하기'),
      ),
      body: const GifticonAddForm(),
    );
  }
}

class GifticonAddForm extends StatefulWidget {
  const GifticonAddForm({Key? key}) : super(key: key);

  @override
  State<GifticonAddForm> createState() => _GifticonAddFormState();
}

class _GifticonAddFormState extends State<GifticonAddForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            const Text('기프티콘 이미지 선택', style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 20,
            ),
            const Text('갤러리에서 기프티콘 이미지를 업로드해 주세요.', style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            const ImagePick(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
