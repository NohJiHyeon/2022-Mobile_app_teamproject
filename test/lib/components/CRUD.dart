import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

/*
  CRUD 메소드들을 모아놓은 클래스입니다.
  자세한 사용 방법은 노션 회의록>firebase 진행상황에 적어두었습니다.
 */

class CRUDTestPage extends StatelessWidget {
  CRUDTestPage({Key? key}) : super(key: key);
  final CRUD crud = CRUD();
  File imageFile = File('lib/images/cat.jpg'); // example image

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              crud.logout();
            },
            child: const Text("로그아웃")),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              crud.add_gifticon("아메리카노 Tall", "스타벅스", 2023, 10, 10, imageFile);
            },
            child: const Text("기프티콘 추가")),
        const SizedBox(
          height: 30,
        ),
        Image.asset("lib/images/cat.jpg"),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () async {
              final dDay = await crud.get_gifticon_dDay("gifticon 3");
              print(dDay);
            },
            child: const Text("디데이 읽어오기")),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () async {
              crud.get_gifticon("gifticon 3");
              // final data = await
              // print(data);
            },
            child: const Text("기프티콘 정보 읽어오기")),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class CRUD {
  final currentUser = FirebaseAuth.instance.currentUser;
  late final gifticon_db = FirebaseFirestore.instance
      .collection('user')
      .doc(currentUser!.uid)
      .collection("gifticon");
  late final brand_db = FirebaseFirestore.instance
      .collection('user')
      .doc(currentUser!.uid)
      .collection("brand");

  // 로그아웃
  void logout() {
    FirebaseAuth.instance.signOut();
    print("로그아웃 완료");
  }

  /*
    기프티콘 관련 함수들
   */

  // 기프티콘 추가
  void add_gifticon(String gifticon_name, String brand, int expire_year,
      int expire_month, int expire_day, File imageFile) async {
    try {
      // storage에 파일 업로드
      // _getImage(imageFile).then((url);
      //   print("업로드 성공: " + url);
      // 등록된 기프티콘 개수 -> firebase의 gifticon_num을 ID로
      final user_data = await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser!.uid)
          .get();
      final gifticon_id = user_data.data()!["gifticon_num"];

      // final gifticon_doc =
      //     gifticon_db.doc("gifticon " + snapshot.docs.length.toString());
      // gifticon_doc.set({
      //   "name": gifticon_name,
      //   "brand": "brand",
      //   "expiration_date": Timestamp.fromDate(
      //       DateTime(expire_year, expire_month, expire_day, 23, 59, 59)),
      //   "canUse": true,
      //   "imageURL": url,
      // });
      // gifticon_doc.get().then((DocumentSnapshot doc) {
      //   final data = doc.data() as Map<String, dynamic>;
      //   print("등록한 기프티콘: " + data.toString());
      // });

    } catch (e) {
      print(e);
    }
  }

  // 이미지 storage에 upload
  Future _getImage(File imageFile) async {
    final _firebaseStorage = FirebaseStorage.instance;
    if (imageFile != null) {
      var snapshot = await _firebaseStorage
          .ref()
          .child('test')
          .putFile(imageFile)
          .whenComplete(() => print("업로드 완료"));

      if (snapshot.state == TaskState.success) {
        var downloadURL = await snapshot.ref.getDownloadURL();
        print("URL: $downloadURL");
        return downloadURL;
      } else {
        print("업로드 실패");
      }
    } else {
      print("이미지 파일을 넣어주세요.");
    }
  }

  // 특정 기프티콘 정보 읽어오기
  void get_gifticon(String gifticon_id) async {
    final gifticon_doc = gifticon_db.doc(gifticon_id);
    DocumentSnapshot doc = await gifticon_doc.get();
    final data = doc.data() as Map<String, dynamic>;
    print(data);
  }

  // 특정 기프티콘의 d-day만 읽어오기
  Future<DateTime> get_gifticon_dDay(String gifticon_id) async {
    final gifticon_doc = gifticon_db.doc(gifticon_id);
    DocumentSnapshot doc = await gifticon_doc.get();
    final data = doc.data() as Map<String, dynamic>;
    DateTime time = data["expiration_date"].toDate();
    // print("유효 기간: " + time!.toString());
    return time;
  }

  // 특정 기프티콘 활성화(사용 가능상태로 만들기)
  void activate_gifticon(String gifticon_id) async {
    final gifticon_doc = gifticon_db.doc(gifticon_id);
    gifticon_doc.update({"canUse": true}).then((value) => print("활성화 처리 완료"));
  }

  // 특정 기프티콘 비활성화(사용완료 상태로 만들기)
  void deactivate_gifticon(String gifticon_id) async {
    final gifticon_doc = gifticon_db.doc(gifticon_id);
    gifticon_doc.update({"canUse": false}).then((value) => print("비활성화 처리 완료"));
  }

  // 특정 기프티콘 삭제
  void delete_gifticon(String gifticon_id) async {
    final gifticon_doc = gifticon_db.doc(gifticon_id);
    gifticon_doc.delete().then((doc) => print("기프티콘 삭제 완료"));
  }

  /*
    브랜드 관련 함수
   */
  // 브랜드 추가
  void add_brand(String brand_name, String barcode) async {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc.set({
      "brand_barcode": barcode,
    });
  }

  void add_discount_brand(
      String brand_name, String discount_brand, String discount_barcode) async {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc
        .collection('discount')
        .doc(brand_name)
        .set({"brand_name": discount_brand, "brand_barcode": discount_barcode});
  }

  void add_membership_brand(String brand_name, String membership_brand,
      String membership_barcode) async {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc.collection('membership').doc(brand_name).set(
        {"brand_name": membership_brand, "brand_barcode": membership_barcode});
  }
}
