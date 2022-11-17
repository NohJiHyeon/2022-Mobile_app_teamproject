import 'package:flutter/material.dart';
import '../brand/brand_main.dart';
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

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.9),
            blurRadius: 4,
            offset: const Offset(4, 4))
      ], borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const BrandMainPage()), (route) => false),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(color),
          fixedSize: MaterialStateProperty.all(Size(width, height)),
        ),
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white)),
      ),

    );
  }
}
