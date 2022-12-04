import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:w3_class/gifticon/gifticon_list.dart';
import '../network/gifticon_crud.dart';
import '../styles.dart';
import '../components/calendar_button.dart';
import '../brand/brand_main.dart';

import 'package:provider/provider.dart';
import '../provider/sort_provider.dart';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';

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

  _save(BuildContext context) async {
    var response = await Dio().get(
        info[0]['imageURL'] ?? "",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: info[0]['name']);
    Navigator.of(context).pop();
    //print(result);
  }

  String getAlertMessage() {
    String message = '';
    switch (text) {
      case '사용하기':
        message = '기프티콘을 사용하시겠습니까?';
        break;
      case '복원하기':
        message = '사용한 기프티콘을 복원하시겠습니까?';
        break;
      case '저장':
        message = '유효기간을 변경하시겠습니까?';
        break;
      case '삭제':
        message = '기프티콘을 삭제하시겠습니까?';
        break;
      default:
        break;
    }
    return message;
  }
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
          console.update_expiration_date(info[0]['gifticon_id'], info[1]);
          break;
        case '삭제':
          snackBarMessage = '기프티콘이 삭제됐습니다.';
          console.delete_gifticon(info);
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
        onPressed: () => {
          if(text == '저장'){

        showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(title: const Text("안내"),
        content: const Text('기프티콘을 저장하시겠습니까?'),
        actions: [
        OutlinedButton(onPressed: (){
        _save(context);

        }, child: const Text("저장")),
        OutlinedButton(onPressed: () => Navigator.pop(context, 'Cancel'),
        child: const Text("취소")),
        ],)
        )

        }
          else{
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => AlertDialog(
                        title: const Text('안내'),
                        content: Text(getAlertMessage()),
                        actions: [
                          OutlinedButton(
                              child: const Text('확인'),
                              onPressed: () {
                                navigateAfterProcess();
                                Navigator.of(context).pop();
                              }),
                          OutlinedButton(
                              child: const Text('취소'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ]))
          }
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
    GifticonCRUD console = GifticonCRUD();
    var data = ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
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
            FittedBox(
              child: Container(
                  width: 300,
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.BRIGHT_GRAY),
                  alignment: Alignment.center,
                  child: Image.network(data['imageURL'])),
            ),
            const SizedBox(height: 20),
            // Text('\'저장\'을 눌러 유효기간을 저장하세요.',
            //     style: TextStyle(
            //         color:
            //             dateFormat == null ? Colors.transparent : Colors.red)),
            const SizedBox(height: 10),
            Container(
                width: 330,
                height: 30,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: data['canUse']
                    ? ElevatedButton(
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
                              console.update_expiration_date(data['gifticon_id'], DateTime.parse(DateFormat('yyyy-MM-dd')
                                  .format(selectedDate)));
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('유효기간이 변경됐습니다.'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.black45,
                              ));
                              setState(() {
                                dateFormat = DateFormat('yyyy-MM-dd')
                                    .format(selectedDate);
                              });
                            }
                            //print(dateFormat);
                          });
                        })
                    : null),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    data['canUse'] ? '사용하기' : '복원하기',
                    140,
                    50,
                    data['canUse'] ? AppColor.APPBAR_COLOR : AppColor.ORANGE,
                    data['gifticon_id']),
                const SizedBox(width: 15),
                data['canUse']
                    ? CustomButton('저장', 100, 50, AppColor.APPBAR_COLOR, [data, dateFormat == null
                    ? data['expiration_date'].toDate()
                    : DateTime.parse(dateFormat!)])
                    : Container(),
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
