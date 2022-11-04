import 'package:flutter/material.dart';
/*
사용법: customButton(텍스트, 너비, 높이, 색깔)
customButton('사용 완료', 180, 50, AppColor.ORANGE)
*/

class customButton extends StatelessWidget {
  const customButton(this.text, this.width, this.height, this.color, {Key? key})
      : super(key: key); //@required this.onPressed
  final String text;
  final double width;
  final double height;
  final Color color;

  //final onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(10),
        shadowColor: MaterialStateProperty.all(Colors.black),
        fixedSize: MaterialStateProperty.all(Size(width, height)),
      ),
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
    );
  }
}
