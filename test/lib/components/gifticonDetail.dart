import 'package:flutter/material.dart';
import '../styles.dart';
import 'button.dart';
import '../components/calendar_button.dart';

class GifticonDetail extends StatefulWidget {
  const GifticonDetail({super.key});

  @override
  State<GifticonDetail> createState() => _GifticonDetailState();
}

class _GifticonDetailState extends State<GifticonDetail> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    print('기프티콘 데이터 ${data}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('기프티콘 정보'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('기프티콘을 사용하거나 유효기간을 바꾸실수 있습니다.'),
          Container(
            width: 350,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            alignment: Alignment.center,
            child: Image.network(data['imageURL'])
          ),
          CalendarButton(330, 30, data['gifticon_id'], data['expiration_date'].toDate()),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              customButton('사용하기', 180, 50, AppColor.ORANGE),
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
