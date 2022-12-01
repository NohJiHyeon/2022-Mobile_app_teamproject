import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../network/gifticon_crud.dart';
import '../styles.dart';
import 'button.dart';
import '../components/calendar_button.dart';

import 'package:provider/provider.dart';
import '../provider/sort_provider.dart';

class GifticonDetail extends StatefulWidget {
  const GifticonDetail({super.key});

  @override
  State<GifticonDetail> createState() => _GifticonDetailState();
}

class _GifticonDetailState extends State<GifticonDetail> {
  DateTime? today = DateTime.now();
  String? dateFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());
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
            Container(
                width: 330,
                height: 30,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: AppColor.EXPIRED_DATE_COLOR,
                      fixedSize: Size(330, 30),
                    ),
                    child: Text('유효기간: ${dateFormat}',
                        style: CustomTextStyle.dateButtonTextStyle),
                    onPressed: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.parse(today.toString()),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2030),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                      ).then((selectedDate) async {
                        if (selectedDate != null) {
                          print(selectedDate);
                          await GifticonCRUD().update_expired_date(data['gifticon_id'], selectedDate);
                          setState(() {
                            today = selectedDate;
                            dateFormat = DateFormat('yyyy-MM-dd').format(selectedDate);
                          });
                        }
                        //print(dateFormat);
                      });
                    })),
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
