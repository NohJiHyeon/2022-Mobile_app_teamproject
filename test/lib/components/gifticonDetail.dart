import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../network/gifticon_crud.dart';
import '../styles.dart';
import '../components/calendar_button.dart';

import 'package:provider/provider.dart';
import '../provider/sort_provider.dart';

import 'package:flutter/material.dart';
import '../brand/brand_main.dart';
/*
사용법: customButton(텍스트, 너비, 높이, 색깔)
customButton('사용 완료', 180, 50, AppColor.ORANGE)
*/

class CustomButton extends StatelessWidget {
  const CustomButton(this.text, this.width, this.height, this.color, {Key? key})
      : super(key: key); //@required this.onPressed
  final String text;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // 저장
    void modifyDateNaivgate() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('날짜가 변경됐습니다.'),
        backgroundColor: Colors.black45,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const BrandMainPage()),
          (route) => false);
    }

    // 사용하기 -> canUse 변경
    void useGifticonNavigate() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('기프티콘을 사용하셨습니다.'),
        backgroundColor: Colors.black45,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const BrandMainPage()),
          (route) => false);
    }

    // 삭제 -> 기프티콘 삭제
    void deleteGifticonNavigate() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('기프티콘이 삭제됐습니다.'),
        backgroundColor: Colors.black45,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const BrandMainPage()),
          (route) => false);
    }

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        onPressed: () => {
          text == '사용하기'
              ? useGifticonNavigate()
              : text == '저장'
                  ? modifyDateNaivgate()
                  : deleteGifticonNavigate()
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(color),
          fixedSize: MaterialStateProperty.all(Size(width, 45)),
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 18, color: Colors.black)),
      ),
    );
  }
}

class GifticonDetail extends StatefulWidget {
  const GifticonDetail({super.key});

  @override
  State<GifticonDetail> createState() => _GifticonDetailState();
}

class _GifticonDetailState extends State<GifticonDetail> {
  String? dateFormat;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    //print('기프티콘 데이터 ${data}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('기프티콘 정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                child: Image.network(data['imageURL'])),
            const SizedBox(height: 20),
            Text('\'저장\'을 눌러 유효기간을 저장하세요.',
                style: TextStyle(
                    color:
                        dateFormat == null ? Colors.transparent : Colors.red)),
            const SizedBox(height: 20),
            Container(
                width: 330,
                height: 30,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: AppColor.EXPIRED_DATE_COLOR,
                      fixedSize: const Size(330, 30),
                    ),
                    child: Text(
                        '유효기간: ${dateFormat ?? DateFormat('yyyy-MM-dd').format(data['expiration_date'].toDate())}',
                        style: CustomTextStyle.dateButtonTextStyle),
                    onPressed: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: data['expiration_date'].toDate(),
                        firstDate: DateTime(DateTime.now().year),
                        lastDate: DateTime(DateTime.now().year + 10),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                      ).then((selectedDate) async {
                        if (selectedDate != null) {
                          print(selectedDate);
                          await GifticonCRUD().update_expired_date(
                              data['gifticon_id'], selectedDate);
                          setState(() {
                            dateFormat =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          });
                        }
                        //print(dateFormat);
                      });
                    })),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomButton('사용하기', 180, 50, AppColor.ORANGE),
                SizedBox(width: 15),
                CustomButton('저장', 80, 50, AppColor.GRAY),
                SizedBox(width: 15),
                CustomButton('삭제', 80, 50, AppColor.GRAY),
              ],
            )
          ],
        ),
      ),
    );
  }
}
