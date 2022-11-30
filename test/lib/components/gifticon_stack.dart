import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:w3_class/styles.dart';

Widget GifticonStackState(dynamic data, BuildContext context) {
  final imgFileName = data['imageURL'];
  final dDay = data['expiration_date'].toDate();
  String expiredDate = DateFormat('yyyy-MM-dd')
      .format(DateTime(dDay.year, dDay.month, dDay.day));
  int getDifference(String dDay) {
    return DateTime.parse(dDay).difference(DateTime.now()).inDays;
  }

  // 유효기간 표시
  String setMessage(String dDay) {
    return getDifference(dDay).toString();
  }

  // Animation 수정 작업 필요
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, '/gifticon_detail', arguments: data),
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
            child: Image.network(imgFileName),
          ),
          Container(
            alignment: const Alignment(0, 0),
            decoration: const BoxDecoration(
                color: AppColor.APPBAR_COLOR,
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(10))),
            // 중앙 정렬
            height: 29,
            width: 69,
            child: Text(
              'D - ${setMessage(expiredDate)}',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          // 유효기간 3일 이하 기프티콘 상태 메시지
          getDifference(expiredDate) >= 3
              ? Container()
              : Positioned.fill(
              child: Align(
                  child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7)),
                      child: Text(getDifference(expiredDate) > 0 ? '만기 임박' : '만기',
                          style: CustomTextStyle.expiredSoonTextStyle)))),
        ]),
      ),
    ),
  );
}
