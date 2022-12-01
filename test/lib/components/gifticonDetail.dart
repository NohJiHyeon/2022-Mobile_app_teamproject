import 'package:firebase_auth/firebase_auth.dart';
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
  const CustomButton(this.text, this.width, this.height, this.color,
      [this.info]); //@required this.onPressed
  final String text;
  final double width;
  final double height;
  final Color color;
  final info;

  @override
  Widget build(BuildContext context) {
    // 저장 info: ['gifticon_id', Datetime]

    void navigateAfterProcess() {
      String snackBarMessage = '';
      GifticonCRUD console = GifticonCRUD();
      switch (text) {
        case '사용하기':
          snackBarMessage = '기프티콘을 사용하셨습니다.';
          console.deactivate_gifticon(info);
          break;
        case '복원하기':
          snackBarMessage = '기프티콘을 재사용할 수 있습니다.';
          console.activate_gifticon(info);
          break;
        case '저장':
          snackBarMessage = '유효기간이 변경됐습니다.';
          console.update_expiration_date(info[0], info[1]);
          break;
        case '삭제':
          snackBarMessage = '기프티콘이 삭제됐습니다.';
          //console.delete_gifticon(info);
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(snackBarMessage),
        duration: const Duration(seconds: 2),
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
        onPressed: () => navigateAfterProcess(),
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
    print(data);
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
            const SizedBox(height: 10),
            Container(
                width: 330,
                height: 30,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: data['canUse'] ? ElevatedButton(
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

                          setState(() {
                            dateFormat =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          });
                        }
                        //print(dateFormat);
                      });
                    }): null),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    data['canUse'] ? '사용하기' : '복원하기',
                    140,
                    50,
                    data['canUse'] ? AppColor.ORANGE : Colors.indigoAccent,
                    data['gifticon_id']),
                const SizedBox(width: 15),
                data['canUse'] ? CustomButton('저장', 100, 50, AppColor.ORANGE, [
                  data['gifticon_id'],
                  dateFormat == null
                      ? data['expiration_date'].toDate()
                      : DateTime.parse(dateFormat!)
                ]) : Container(),
                const SizedBox(width: 15),
                CustomButton('삭제', 100, 50, AppColor.GRAY, data['gifticon_id']),
              ],
            )
          ],
        ),
      ),
    );
  }
}
