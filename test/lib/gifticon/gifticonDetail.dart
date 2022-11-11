import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles.dart';
import '../components/button.dart';
import '../components/calendar_button.dart';

class GifticonDetail extends StatefulWidget {
  const GifticonDetail({Key? key}) : super(key: key);

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
              height: 500,
              decoration: BoxDecoration(
                  color: AppColor.GRAY,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.9),
                        blurRadius: 4,
                        offset: const Offset(4, 4))
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset('lib/images/gifticon.jpg')),
              )),
          const SizedBox(height: 30),
          const CalendarButton(330, 30),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              customButton('멤버십 사용', 150, 50, AppColor.ORANGE),
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
