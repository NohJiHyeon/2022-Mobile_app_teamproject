import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BrandCRUD {
  final currentUser = FirebaseAuth.instance.currentUser;
  late final brand_db = FirebaseFirestore.instance
      .collection('user')
      .doc(currentUser!.uid)
      .collection("brand");

  // 브랜드 추가
  void add_brand(String brand_name, String barcode) async {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc.set({
      "brand_barcode": barcode,
    });
    print("$brand_name 바코드: $barcode, 브랜드 추가 완료");
  }

  void add_discount_brand(
      String brand_name, String discount_brand, String discount_barcode) async {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc
        .collection('discount')
        .doc(discount_brand)
        .set({"brand_barcode": discount_barcode});
    print(
        "$brand_name의 할인 브랜드 - $discount_brand 바코드: $discount_barcode, 추가 완료");
  }

  void add_membership_brand(String brand_name, String membership_brand,
      String membership_barcode) async {
    final brand_doc = brand_db.doc(brand_name);
    brand_doc
        .collection('membership')
        .doc(membership_brand)
        .set({"brand_barcode": membership_barcode});
    print(
        "$brand_name의 멤버쉽 브랜드 - $membership_brand 바코드: $membership_barcode, 추가 완료");
  }
}
