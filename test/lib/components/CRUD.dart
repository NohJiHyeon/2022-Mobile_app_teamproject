import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

/*
  CRUD 메소드들을 모아놓은 클래스입니다.
  class 자체를 import해서 사용하면 되고,
  복사 붙여넣기로 사용하고 싶을 때는 currentUser, db 변수도 함께 복사해야 합니다
 */

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
      int expire_month, int expire_day) {
    final gifticon_doc = gifticon_db.doc(gifticon_name);
    gifticon_doc.set({
      "name": gifticon_name,
      "brand": "brand",
      "expiration_date": Timestamp.fromDate(
          DateTime(expire_year, expire_month, expire_day, 23, 59, 59)),
      "canUse": true,
      "imageURL":
          "https://firebasestorage.googleapis.com/v0/b/test-project-soeun.appspot.com/o/test%2FimageName?alt=media&token=99ba4e8d-e469-4727-86e4-20b40c6ff554"
    });
  }

  // 특정 기프티콘 정보 읽어오기
  void get_gifticon(String gifticon_name) {
    final gifticon_doc = gifticon_db.doc(gifticon_name);
    gifticon_doc.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data);
      // 유효기간 가져오기
      DateTime time = data["expiration_date"].toDate();
      print("유효 기간: " + time!.toString());
    });
  }

  // 특정 기프티콘의 d-day만 읽어오기
  void get_gifticon_dDay(String gifticon_name) {
    final gifticon_doc = gifticon_db.doc(gifticon_name);
    gifticon_doc.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      DateTime time = data["expiration_date"].toDate();
      print("유효 기간: " + time!.toString());
    });
  }

  // 특정 기프티콘 활성화(사용 가능상태로 만들기)
  void activate_gifticon(String gifticon_name) {
    final gifticon_doc = gifticon_db.doc(gifticon_name);
    gifticon_doc.update({"canUse": true}).then((value) => print("활성화 처리 완료"));
  }

  // 특정 기프티콘 비활성화(사용완료 상태로 만들기)
  void deactivate_gifticon(String gifticon_name) {
    final gifticon_doc = gifticon_db.doc(gifticon_name);
    gifticon_doc.update({"canUse": false}).then((value) => print("비활성화 처리 완료"));
  }

  // 특정 기프티콘 삭제
  void delete_gifticon(String gifticon_name) {
    final gifticon_doc = gifticon_db.doc(gifticon_name);
    gifticon_doc.delete().then((doc) => print("기프티콘 삭제 완료"));
  }

  /*
    브랜드 관련 함수
   */
  // 브랜드 추가
  void add_brand(String brand_name, String barcode) {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc.set({
      "brand_barcode": barcode,
    });
  }

  void add_discount_brand(
      String brand_name, String discount_brand, String discount_barcode) {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc
        .collection('discount')
        .doc(brand_name)
        .set({"brand_name": discount_brand, "brand_barcode": discount_barcode});
  }

  void add_membership_brand(
      String brand_name, String membership_brand, String membership_barcode) {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc.collection('membership').doc(brand_name).set(
        {"brand_name": membership_brand, "brand_barcode": membership_barcode});
  }
}
