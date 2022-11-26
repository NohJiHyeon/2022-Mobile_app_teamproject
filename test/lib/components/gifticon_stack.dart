import 'package:flutter/material.dart';
import 'package:w3_class/styles.dart';

Widget GifticonStackState(
    String imgFileName, String dDay, BuildContext context) {

  String setMessage(String dDay) {
    int day = int.parse(dDay);
    if (day == 0) {
      return '마감 임박';
    } else if (day < 3) {
      return '마감 예정';
    } else {
      return '';
    }
  }

  // Animation 수정 작업 필요
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, '/gifticon_detail'),
    child: AnimatedContainer(
      duration: const Duration(seconds: 4),
      curve: Curves.fastOutSlowIn,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(alignment: Alignment.topLeft, children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Image.asset(imgFileName),
          ),
          Container(
            alignment: const Alignment(0, 0),
            // 중앙 정렬
            color: AppColor.GRAY,
            height: 29,
            width: 69,
            child: Text(
              'D-$dDay',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          int.parse(dDay) >= 3
              ? Container()
              : Positioned.fill(
                  child: Align(
                      child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7)),
                          child: Text(setMessage(dDay),
                              style: CustomTextStyle.expiredSoonTextStyle)))),
        ]),
      ),
    ),
  );
}
