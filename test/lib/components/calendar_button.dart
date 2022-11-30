import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles.dart';
import '../network/gifticon_crud.dart';

/*
사용법: CalendarButton(width, height),
EX: CalendarButton(330, 30)
*/

class CalendarButton extends StatefulWidget {
  const CalendarButton(this.width, this.height, this.gifticonId, this.expiredDate, {Key? key}) : super(key: key);
  final double width;
  final double height;
  final gifticonId;
  final expiredDate;

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  DateTime? today = DateTime.now();
  String? dateFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final GifticonCRUD gifticonCRUD = GifticonCRUD();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(20)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: AppColor.EXPIRED_DATE_COLOR,
              fixedSize: Size(widget.width, widget.height),
            ),
            child: Text('유효기간: ${DateFormat('yyyy-MM-dd').format(widget.expiredDate)}',
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
                  await gifticonCRUD.update_expired_date(widget.gifticonId, selectedDate);
                  setState(() {
                    today = selectedDate;
                    dateFormat = DateFormat('yyyy-MM-dd').format(selectedDate);
                  });
                }
                //print(dateFormat);
              });
            }));
  }
}
