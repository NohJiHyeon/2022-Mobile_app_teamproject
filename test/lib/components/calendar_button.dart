import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles.dart';

class CalendarButton extends StatefulWidget {
  const CalendarButton({Key? key, this.width, this.height}) : super(key: key);
  final double ?width;
  final double ?height;

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  DateTime? expiredDate = DateTime.now();
  String? dateFormat = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          backgroundColor:
          MaterialStateProperty.all(AppColor.EXPIRED_DATE_COLOR),
          fixedSize: MaterialStateProperty.all(Size(200, 30)),
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
        });
  }
}