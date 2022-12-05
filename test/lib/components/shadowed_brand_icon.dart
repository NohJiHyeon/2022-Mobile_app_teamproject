import 'package:flutter/material.dart';

Widget ShadowedBrandIcon(String imgFileName,String fileFormat){
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      /*
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.7),
          blurRadius:4,
          offset: const Offset(0,4),
        )
      ],
       */
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('lib/images/$imgFileName 로고.$fileFormat'),
    ),
  );
}