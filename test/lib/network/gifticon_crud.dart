import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GifticonCRUD {
  final currentUser = FirebaseAuth.instance.currentUser;
  late final gifticon_db = FirebaseFirestore.instance
      .collection('user')
      .doc(currentUser!.uid)
      .collection("gifticon");

  // 로그아웃 (임시로 gifticon_crud.dart에 넣어둠)
  void logout() {
    FirebaseAuth.instance.signOut();
    print("로그아웃 완료");
  }

  // 기프티콘 추가
  void add_gifticon(String gifticon_name, String brand, int expire_year,
      int expire_month, int expire_day, File imageFile) async {
    // 등록된 기프티콘 개수 -> firebase의 gifticon_num을 ID로
    final user_data = await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser!.uid)
        .get();
    final gifticon_id_num = user_data.data()!["gifticon_num"] as int;

    // storage에 파일 업로드
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot = await _firebaseStorage
        .ref()
        .child(currentUser!.uid + gifticon_id_num.toString())
        .putFile(imageFile)
        .whenComplete(() => print("업로드 완료"));

    if (snapshot.state == TaskState.success) {
      var downloadURL = await snapshot.ref.getDownloadURL(); // 업로드한 이미지의 url
      final gifticon_doc = gifticon_db.doc("gifticon $gifticon_id_num");

      gifticon_doc.set({
        "name": gifticon_name,
        "brand": brand,
        "expiration_date": Timestamp.fromDate(
            DateTime(expire_year, expire_month, expire_day, 23, 59, 59)),
        "canUse": true,
        "imageURL": downloadURL,
      });

      gifticon_doc.get().then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print("등록한 기프티콘: " + data.toString());
      });
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

  // 모든 기프티콘 리스트 읽어오기
  Future get_gifticon_list() async {
    QuerySnapshot snapshot = await gifticon_db.get();
    final data = [];
    for (var doc in snapshot.docs) {
      var data_element = doc.data() as Map<String, dynamic>;
      data_element["gifticon_id"] = doc.id;
      data.add(data_element);
    }
    return data;
  }

  // 특정 기프티콘 정보 읽어오기
  Future<Map<String, dynamic>> get_gifticon(String gifticon_id) async {
    final gifticon_doc = gifticon_db.doc(gifticon_id);
    DocumentSnapshot doc = await gifticon_doc.get();
    final data = doc.data() as Map<String, dynamic>;
    return data;
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
}
