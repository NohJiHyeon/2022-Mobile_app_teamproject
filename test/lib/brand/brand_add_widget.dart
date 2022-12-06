import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'brand_barcode_scan.dart';
import 'brand_image_picker.dart';
import 'package:w3_class/styles.dart';


class AddTMembership extends StatefulWidget {
  String brand = '';
  AddTMembership(this.brand);
  @override
  State<AddTMembership> createState() => _AddTMembershipState(brand);
}

class _AddTMembershipState extends State<AddTMembership> {
  String barcode = 'null';
  String brand = '';
  _AddTMembershipState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/T 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('T 멤버십 바코드 이미지'),
          const SizedBox(
            height: 20,
          ),
          BrandDiscountImagePick(brand, 'T'),
        ],
      ),
    );
  }
}

class AddKTMembership extends StatefulWidget {
  String brand = '';
  AddKTMembership(this.brand);
  @override
  State<AddKTMembership> createState() => _AddKTMembershipState(brand);
}

class _AddKTMembershipState extends State<AddKTMembership> {
  String barcode = 'null';
  String brand = '';
  _AddKTMembershipState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        decoration: BoxDecoration(
        border: Border.all(
        color: AppColor.ORANGE,
        width: 4),
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset('lib/images/kt 헤더.jpg', width: 700),
        const SizedBox(
          height: 20,
        ),
        Text('KT 멤버십 바코드 이미지'),
        const SizedBox(
          height: 20,
        ),
        BrandDiscountImagePick(brand, 'KT'),
      ],
    ),
    );
  }
}

class AddUPlusMembership extends StatefulWidget {
  String brand = '';
  AddUPlusMembership(this.brand);
  @override
  State<AddUPlusMembership> createState() => _AddUPlusMembershipState(brand);
}

class _AddUPlusMembershipState extends State<AddUPlusMembership> {
  String barcode = 'null';
  String brand = '';
  _AddUPlusMembershipState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        decoration: BoxDecoration(
        border: Border.all(
        color: AppColor.ORANGE,
        width: 4),
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset('lib/images/U+ 헤더.jpg', width: 700),
        const SizedBox(
          height: 20,
        ),
        Text('U+ 멤버십 바코드 이미지'),
        const SizedBox(
          height: 20,
        ),
        BrandDiscountImagePick(brand, 'UPlus'),
      ],
    ),
    );
  }
}

class AddKiaMembership extends StatefulWidget {
  String brand = '';
  AddKiaMembership(this.brand);
  @override
  State<AddKiaMembership> createState() => _AddKiaMembershipState(brand);
}

class _AddKiaMembershipState extends State<AddKiaMembership> {
  String barcode = 'null';
  String brand = '';
  _AddKiaMembershipState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/기아멤버스 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('기아멤버스 멤버십 바코드 이미지'),
          const SizedBox(
            height: 20,
          ),
          BrandMembershipImagePick(brand, 'Kia'),
        ],
      ),
    );
  }
}

class AddOKMembership extends StatefulWidget {
  String brand = '';
  AddOKMembership(this.brand);
  @override
  State<AddOKMembership> createState() => _AddOKMembershipState(brand);
}

class _AddOKMembershipState extends State<AddOKMembership> {
  String barcode = 'null';
  String brand = '';
  _AddOKMembershipState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/OK캐쉬백 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('OK캐쉬백 멤버십 바코드 이미지'),
          const SizedBox(
            height: 20,
          ),
          BrandMembershipImagePick(brand, 'OK캐쉬백'),
        ],
      ),
    );
  }
}

class AddLPointMembership extends StatefulWidget {
  String brand = '';
  AddLPointMembership(this.brand);
  @override
  State<AddLPointMembership> createState() => _AddLPointMembershipState(brand);
}

class _AddLPointMembershipState extends State<AddLPointMembership> {
  String barcode = 'null';
  String brand = '';
  _AddLPointMembershipState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/L Point 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('L Point 멤버십 바코드 이미지'),
          const SizedBox(
            height: 20,
          ),
          BrandMembershipImagePick(brand, 'LPoint'),
        ],
      ),
    );
  }
}

class AddCJOneMembership extends StatefulWidget {
  String brand = '';
  AddCJOneMembership(this.brand);
  @override
  State<AddCJOneMembership> createState() => _AddCJOneMembershipState(brand);
}

class _AddCJOneMembershipState extends State<AddCJOneMembership> {
  String barcode = 'null';
  String brand = '';
  _AddCJOneMembershipState(this.brand);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/CJ ONE 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('CJ ONE 멤버십 바코드 이미지'),
          const SizedBox(
            height: 20,
          ),
          BrandMembershipImagePick(brand, 'CJ ONE'),
        ],
      ),
    );
  }
}

class AddStarbucks extends StatelessWidget {
  const AddStarbucks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        decoration: BoxDecoration(
        border: Border.all(
        color: AppColor.ORANGE,
        width: 4),
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset('lib/images/스타벅스 헤더.jpg', width: 700),
        const SizedBox(
          height: 20,
        ),
        Text('스타벅스 멤버십 바코드 이미지'),
        BrandAddImagePick('스타벅스'),
      ],
    ),
    );
  }
}

class AddEdiya extends StatelessWidget {
  const AddEdiya({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/이디야 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('이디야 멤버십 바코드 이미지'),
          BrandAddImagePick('이디야'),
        ],
      ),
    );
  }
}

class AddGongcha extends StatelessWidget {
  const AddGongcha({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/공차 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('공차 멤버십 바코드 이미지'),
          BrandAddImagePick('공차'),
        ],
      ),
    );
  }
}

class AddSulbing extends StatelessWidget {
  const AddSulbing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/설빙 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('설빙 멤버십 바코드 이미지'),
          BrandAddImagePick('설빙'),
        ],
      ),
    );
  }
}
class AddCU extends StatelessWidget {
  const AddCU({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/CU 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('CU 멤버십 바코드 이미지'),
          BrandAddImagePick('CU'),
        ],
      ),
    );
  }
}

class AddKyochon extends StatelessWidget {
  const AddKyochon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/교촌치킨 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('교촌치킨 멤버십 바코드 이미지'),
          BrandAddImagePick('교촌치킨'),
        ],
      ),
    );
  }
}

class AddBBQ extends StatelessWidget {
  const AddBBQ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/bbq 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('bbq 멤버십 바코드 이미지'),
          BrandAddImagePick('bbq'),
        ],
      ),
    );
  }
}

class AddMcDonalds extends StatelessWidget {
  const AddMcDonalds({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/맥도날드 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('맥도날드 멤버십 바코드 이미지'),
          BrandAddImagePick('맥도날드'),
        ],
      ),
    );
  }
}

class AddBurgerKing extends StatelessWidget {
  const AddBurgerKing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColor.ORANGE,
            width: 4),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('lib/images/버거킹 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          Text('버거킹 멤버십 바코드 이미지'),
          BrandAddImagePick('버거킹'),
        ],
      ),
    );
  }
}