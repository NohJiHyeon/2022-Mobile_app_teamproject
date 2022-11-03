import 'package:flutter/material.dart';
import './styles.dart';

class GifticonDetail extends StatefulWidget {
  const GifticonDetail({super.key});

  @override
  State<GifticonDetail> createState() => _GifticonDetailState();
}

class _GifticonDetailState extends State<GifticonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기프티콘 생성'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.BRIGHT_GRAY,
            ),
            alignment: Alignment.center,
            child: Text('이미지 파일',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('사용 완료',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                    backgroundColor: MaterialStateProperty.all(AppColor.ORANGE),
                    elevation: MaterialStateProperty.all(10),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                  width: 80,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('저장',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.GRAY),
                        elevation: MaterialStateProperty.all(10),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                      ))),
              SizedBox(width: 15),
              SizedBox(
                  width: 80,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('삭제',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.GRAY),
                        elevation: MaterialStateProperty.all(10),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
