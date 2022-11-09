import 'package:flutter/material.dart';
import '../styles.dart';
import 'button.dart';

class GifticonDetail extends StatefulWidget {
  const GifticonDetail({super.key});

  @override
  State<GifticonDetail> createState() => _GifticonDetailState();
}

class _GifticonDetailState extends State<GifticonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기프티콘 생성'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.BRIGHT_GRAY,
            ),
            alignment: Alignment.center,
            child: const Text('이미지 파일',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              customButton('사용 완료', 180, 50, AppColor.ORANGE),
              SizedBox(width: 15),
              customButton('저장', 80, 50, AppColor.GRAY),
              SizedBox(width: 15),
              customButton('삭제', 80, 50, AppColor.GRAY),
            ],
          )
        ],
      ),
    );
  }
}
