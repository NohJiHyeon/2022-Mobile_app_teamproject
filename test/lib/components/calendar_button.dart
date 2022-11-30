import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles.dart';

/*
사용법: CalendarButton(width, height),
EX: CalendarButton(330, 30)
*/

class CalendarButton extends StatefulWidget {
  const CalendarButton(this.width, this.height, {Key? key}) : super(key: key);
  final double width;
  final double height;

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  DateTime? expiredDate = DateTime.now();
  String? dateFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());

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
            child: Text('유효기간: $dateFormat',
                style: CustomTextStyle.dateButtonTextStyle),
            onPressed: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.parse(expiredDate.toString()),
                firstDate: DateTime(2022),
                lastDate: DateTime(2030),
                initialEntryMode: DatePickerEntryMode.calendarOnly,
              ).then((selectedDate) {
                if (selectedDate != null) {
                  setState(() {
                    expiredDate = selectedDate;
                    dateFormat = DateFormat('yyyy-MM-dd').format(selectedDate);
                  });
                }
                //print(dateFormat);
              });
            }));
  }
}