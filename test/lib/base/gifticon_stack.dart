import 'package:flutter/material.dart';

Widget GifticonStackState(String imgFileName, String dDay) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(alignment: Alignment.topLeft, children: [
      Image.asset(imgFileName),
      Container(
        alignment: Alignment(0, 0), // 중앙 정렬
        // color: AppColor.GRAY,
        color: Colors.grey,
        height: 29,
        width: 69,
        child: Text(
          'D-$dDay',
          style: const TextStyle(fontSize: 15),
        ),
      )
    ]),
  );
}
