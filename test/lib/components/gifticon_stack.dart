import 'package:flutter/material.dart';
import 'package:w3_class/styles.dart';

Widget GifticonStackState(String imgFileName, String dDay) {
  return Padding(
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
        alignment: const Alignment(0, 0), // 중앙 정렬
        color: AppColor.GRAY,
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
