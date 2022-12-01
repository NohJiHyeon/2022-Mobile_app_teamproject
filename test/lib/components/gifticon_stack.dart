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
    return (DateTime.parse(dDay).difference(DateTime.now()).inHours / 24)
        .ceil();
  }

  // 유효기간 표시
  String setMessage(String dDay) {
    return getDifference(dDay).toString();
  }

  return GestureDetector(
    onTap: () =>
        Navigator.pushNamed(context, '/gifticon_detail', arguments: data),
    child: AnimatedContainer(
      duration: const Duration(seconds: 4),
      curve: Curves.fastOutSlowIn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //overflow 방지
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(alignment: Alignment.topLeft, children: [
                    // 이미지 크기 고정
                    FittedBox(
                      child: Container(
                          width: 200,
                          height: 200,
                          decoration:
                              BoxDecoration(color: Colors.white70, boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            )
                          ]),
                          child: Opacity(
                              opacity: data['canUse'] ? 1 : 0.5,
                              child: Image.network(imgFileName))),
                    ),
                    Container(
                        alignment: const Alignment(0, 0),
                        decoration: const BoxDecoration(
                            color: AppColor.APPBAR_COLOR,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10))),
                        // 중앙 정렬
                        height: 29,
                        width: 69,
                        child: Text(
                          data['canUse']
                              ? int.parse(setMessage(expiredDate)) >= 0
                                  ? 'D - ${setMessage(expiredDate)}'
                                  : '만기됨'
                              : ' ',
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        )),
                    // 유효기간 3일 이하 기프티콘 상태 메시지
                    getDifference(expiredDate) < 3 || !data['canUse']
                        ? Positioned.fill(
                            child: Align(
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7)),
                                    child: Text(
                                        data['canUse']
                                            ? (getDifference(expiredDate) >= 0
                                                ? '만기 임박'
                                                : '만기')
                                            : '사용됨',
                                        style: CustomTextStyle
                                            .expiredSoonTextStyle))))
                        : Container(),
                  ]),
                ),
              ),
              Text(data['name']),
            ],
          ),
        ],
      ),
    ),
  );
}
