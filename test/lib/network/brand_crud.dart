import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BrandCRUD {
  final currentUser = FirebaseAuth.instance.currentUser;
  late final brandDb = FirebaseFirestore.instance
      .collection('user')
      .doc(currentUser!.uid)
      .collection("brand");

  // 브랜드 추가
  Future add_brand(String brandName, String barcode) async {
    final brandDoc = brandDb.doc(brandName);
    brandDoc.set({
      "brand_barcode": barcode,
    });
    print("$brandName 바코드: $barcode, 브랜드 추가 완료");
  }

  // TODO: 할인 브랜드, 적립 브랜드 없는 브랜드에 추가할 때 exception 만들기
  // TODO: 없는 컬렉션에 접근햇을 때 어떻게 나오는지
  // 할인 브랜드 추가
  Future add_discount_brand(
      String brandName, String discountBrand, String discountBarcode) async {
    final brandDoc = brandDb.doc(brandName);
    brandDoc
        .collection('discount')
        .doc(discountBrand)
        .set({"brand_barcode": discountBarcode});
    print("$brandName의 할인 브랜드 - $discountBrand 바코드: $discountBarcode, 추가 완료");
  }

  // 적립 브랜드 추가
  Future add_membership_brand(String brandName, String membershipBrand,
      String membershipBarcode) async {
    final brandDoc = brandDb.doc(brandName);
    brandDoc
        .collection('membership')
        .doc(membershipBrand)
        .set({"brand_barcode": membershipBarcode});
    print(
        "$brandName의 멤버쉽 브랜드 - $membershipBrand 바코드: $membershipBarcode, 추가 완료");
  }

  // 브랜드 리스트 읽어오기
  Future get_brand_list() async {
    final QuerySnapshot snapshot = await brandDb.get();
    final data = [];
    for (var doc in snapshot.docs) {
      var dataElement = doc.data() as Map<String, dynamic>; // 브랜드 바코드
      dataElement["brand_name"] = doc.id; // 브랜드 이름
      // 할인 브랜드 리스트
      var brand_list = await get_discount_brand_list(doc.id);
      dataElement["discount_list"] = brand_list;
      // 적립 브랜드 리스트
      var membership_list = await get_membership_brand_list(doc.id);
      dataElement["membership_list"] = membership_list;
      data.add(dataElement);
    }
    return data;
  }

  // 특정 브랜드 리스트 읽어오기
  Future get_brand_info(String brand) async {
    final brandDoc = brandDb.doc(brand);
    DocumentSnapshot doc = await brandDoc.get();
    final data = doc.data() as Map<String, dynamic>;
    if (data == null) {
      // 브랜드에 등록된 기프티콘이 없을 경우
      return {};
    }
    // 할인 브랜드 리스트
    var brand_list = await get_discount_brand_list(brand);
    data["discount_list"] = brand_list;
    // 적립 브랜드 리스트
    var membership_list = await get_membership_brand_list(brand);
    data["membership_list"] = membership_list;
    return data;
  }

  // 할인 브랜드 읽어오기
  Future get_discount_brand_list(String brand) async {
    final QuerySnapshot snapshot =
        await brandDb.doc(brand).collection("discount").get();
    final data = [];
    for (var doc in snapshot.docs) {
      var dataElement = doc.data() as Map<String, dynamic>;
      dataElement["discount_brand_name"] = doc.id;
      data.add(dataElement);
    }
    return data;
  }

  // 적립 브랜드 읽어오기
  Future get_membership_brand_list(String brand) async {
    final QuerySnapshot snapshot =
        await brandDb.doc(brand).collection("membership").get();
    final data = [];
    for (var doc in snapshot.docs) {
      var dataElement = doc.data() as Map<String, dynamic>;
      dataElement["membership_brand_name"] = doc.id;
      data.add(dataElement);
    }
    return data;
  }
}
