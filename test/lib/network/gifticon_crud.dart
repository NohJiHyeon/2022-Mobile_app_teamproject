import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GifticonCRUD {
  final currentUser = FirebaseAuth.instance.currentUser;
  late final gifticonDB = FirebaseFirestore.instance
      .collection('user')
      .doc(currentUser!.uid)
      .collection("gifticon");

  // 로그아웃 (임시로 gifticon_crud.dart에 넣어둠)
  void logout() {
    FirebaseAuth.instance.signOut();
    print("로그아웃 완료");
  }

  // 기프티콘 추가
  Future add_gifticon(String gifticonName, String brand, DateTime expireDate,
      File imageFile, String gifticonBarcode) async {
    // 등록된 기프티콘 개수 -> firebase의 gifticon_num을 ID로 사용
    final userRef =
        FirebaseFirestore.instance.collection('user').doc(currentUser!.uid);
    final userData = await userRef.get();
    final gifticonIdNum = userData.data()!["gifticon_num"] as int;
    userRef.update({"gifticon_num": gifticonIdNum + 1}); // 기프티콘 id 1 증가

    // storage에 이미지 파일 업로드
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot = await _firebaseStorage
        .ref()
        .child(currentUser!.uid + gifticonIdNum.toString())
        .putFile(imageFile)
        .whenComplete(() => print("업로드 완료"));

    // 이미지 파일 업로드 성공하면 기프티콘 추가
    if (snapshot.state == TaskState.success) {
      var downloadURL = await snapshot.ref.getDownloadURL(); // 업로드한 이미지의 url
      final gifticonDoc = gifticonDB.doc("gifticon $gifticonIdNum");

      gifticonDoc.set({
        "name": gifticonName,
        "brand": brand,
        "expiration_date": Timestamp.fromDate(DateTime(
            expireDate.year, expireDate.month, expireDate.day, 23, 59, 59)),
        "canUse": true,
        "imageURL": downloadURL,
        "gifticon_barcode": gifticonBarcode,
        "created_date": Timestamp.fromDate(DateTime.now()),
      });

      gifticonDoc.get().then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print("등록한 기프티콘: $data");
      });
    }
  }

  // 모든 기프티콘 리스트 읽어오기
  Future get_gifticon_list() async {
    QuerySnapshot snapshot = await gifticonDB.get();
    final data = [];
    for (var doc in snapshot.docs) {
      var dataElement = doc.data() as Map<String, dynamic>;
      dataElement["gifticon_id"] = doc.id;
      data.add(dataElement);
    }
    return data;
  }

  // 특정 기프티콘 정보 읽어오기
  Future<Map<String, dynamic>> get_gifticon(String gifticonId) async {
    final gifticonDoc = gifticonDB.doc(gifticonId);
    DocumentSnapshot doc = await gifticonDoc.get();
    final data = doc.data() as Map<String, dynamic>;
    return data;
  }

  // 브랜드의 기프티콘 리스트 읽어오기
  Future get_brand_gifticon_list(String brand) async {
    final QuerySnapshot querySnapshot =
        await gifticonDB.where("brand", isEqualTo: brand).get();
    final data = [];
    for (var doc in querySnapshot.docs) {
      var dataElement = doc.data() as Map<String, dynamic>;
      dataElement["gifticon_id"] = doc.id; // gifticon ID도 함께 전달
      data.add(dataElement);
    }
    return data;
  }

  // 특정 기프티콘의 d-day만 읽어오기
  Future<DateTime> get_gifticon_dDay(String gifticonId) async {
    final gifticonDoc = gifticonDB.doc(gifticonId);
    DocumentSnapshot doc = await gifticonDoc.get();
    final data = doc.data() as Map<String, dynamic>;
    DateTime time = data["expiration_date"].toDate();
    print("유효 기간: " + time!.toString());
    return time;
  }

  // 특정 기프티콘 활성화(사용 가능상태로 만들기)
  Future activate_gifticon(String gifticonId) async {
    final gifticonDoc = gifticonDB.doc(gifticonId);
    gifticonDoc.update({"canUse": true}).then((value) => print("활성화 처리 완료"));
  }

  // 특정 기프티콘 비활성화(사용완료 상태로 만들기)
  Future deactivate_gifticon(String gifticonId) async {
    final gifticonDoc = gifticonDB.doc(gifticonId);
    gifticonDoc.update({"canUse": false}).then((value) => print("비활성화 처리 완료"));
  }

  // 특정 기프티콘 삭제
  Future delete_gifticon(String gifticonId) async {
    final gifticonDoc = gifticonDB.doc(gifticonId);
    gifticonDoc.delete().then((doc) => print("기프티콘 삭제 완료"));
  }

  // 기프티콘 유효기간 변경
  Future update_expiration_date(String gifticonId, DateTime expiredDate) async {
    final gifticonDoc = gifticonDB.doc(gifticonId);
    gifticonDoc.update({
      "expiration_date": Timestamp.fromDate(
          DateTime(expiredDate.year, expiredDate.month, expiredDate.day))
    }).then((value) => print("유효기간 변경 완료"));
  }
}
