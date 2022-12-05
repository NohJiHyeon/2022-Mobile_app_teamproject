import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'brand_barcode_scan.dart';
import 'brand_image_picker.dart';


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
    return Column(
      children: [
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
    return Column(
      children: [
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
    return Column(
      children: [
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
    return Column(
      children: [
        Image.asset('lib/images/기아멤버스 헤더.png', width: 700),
        const SizedBox(
          height: 20,
        ),
        Text('기아멤버스 바코드 이미지'),
        const SizedBox(
          height: 20,
        ),
        BrandMembershipImagePick(brand, 'Kia'),
      ],
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
    return Column(
      children: [
        Image.asset('lib/images/OK캐쉬백 헤더.png', width: 700),
        const SizedBox(
          height: 20,
        ),
        Text('OK캐쉬백 바코드 이미지'),
        const SizedBox(
          height: 20,
        ),
        BrandMembershipImagePick(brand, 'OK캐쉬백'),
      ],
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
    return Column(
      children: [
        Image.asset('lib/images/L Point 헤더.png', width: 700),
        const SizedBox(
          height: 20,
        ),
        Text('L Point 바코드 이미지'),
        const SizedBox(
          height: 20,
        ),
        BrandMembershipImagePick(brand, 'LPoint'),
      ],
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
    return Column(
      children: [
        Image.asset('lib/images/CJ ONE 헤더.jpg', width: 700),
        const SizedBox(
          height: 20,
        ),
        Text('CJ ONE 바코드 이미지'),
        const SizedBox(
          height: 20,
        ),
        BrandMembershipImagePick(brand, 'CJ ONE'),
      ],
    );
  }
}

class AddStarbucks extends StatelessWidget {
  const AddStarbucks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/스타벅스 헤더.jpg', width: 700),
        BrandAddImagePick('스타벅스'),
      ],
    );
  }
}

class AddEdiya extends StatelessWidget {
  const AddEdiya({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/이디야 헤더.jpg', width: 700),
        BrandAddImagePick('이디야'),
      ],
    );
  }
}

class AddGongcha extends StatelessWidget {
  const AddGongcha({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/공차 헤더.jpg', width: 700),
        BrandAddImagePick('공차'),
      ],
    );
  }
}

class AddSulbing extends StatelessWidget {
  const AddSulbing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/설빙 헤더.jpg', width: 700),
        BrandAddImagePick('설빙'),
      ],
    );
  }
}
class AddCU extends StatelessWidget {
  const AddCU({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/CU 헤더.jpg', width: 700),
        BrandAddImagePick('CU'),
      ],
    );
  }
}

class AddKyochon extends StatelessWidget {
  const AddKyochon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/교촌치킨 헤더.png', width: 700),
        BrandAddImagePick('교촌치킨'),
      ],
    );
  }
}

class AddBBQ extends StatelessWidget {
  const AddBBQ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/bbq 헤더.jpg', width: 700),
        BrandAddImagePick('BBQ'),
      ],
    );
  }
}

class AddMcDonalds extends StatelessWidget {
  const AddMcDonalds({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/맥도날드 헤더.jpg', width: 700),
        BrandAddImagePick('맥도날드'),
      ],
    );
  }
}

class AddBurgerKing extends StatelessWidget {
  const AddBurgerKing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/images/버거킹 헤더.jpg', width: 700),
        BrandAddImagePick('버거킹'),
      ],
    );
  }
}
/*
class AddMegabox extends StatelessWidget {
  const AddMegabox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final barcode = ModalRoute.of(context)?.settings.arguments;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          Image.asset('lib/images/메가박스 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('Megabox','kt', 'jpg'),
          AddMembershipHelper('Megabox','U+', 'jpg'),
          AddMembershipHelper('Megabox','L Point', 'png'),
          AddMembershipHelper('Megabox','OK캐쉬백', 'png'),
        ],
      ),
    );
  }
}

class AddCGV extends StatelessWidget {
  const AddCGV({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset('lib/images/cgv 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('CGV','kt', 'jpg'),
          AddMembershipHelper('CGV','U+', 'jpg'),
          AddMembershipHelper('CGV','OK캐쉬백', 'png'),
          AddMembershipHelper('CGV','기아멤버스', 'png'),
        ],
      ),
    );
  }
}

class AddLotteCinema extends StatelessWidget {
  const AddLotteCinema({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset('lib/images/롯데시네마 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('롯데시네마','T', 'png'),
          AddMembershipHelper('롯데시네마','kt', 'jpg'),
          AddMembershipHelper('롯데시네마','OK캐쉬백', 'png'),
          AddMembershipHelper('롯데시네마','기아멤버스', 'png'),
        ],
      ),
    );
  }
}

class AddBurgerKing extends StatelessWidget {
  const AddBurgerKing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('버거킹','버거킹', 'jpg'),
        ],
      ),
    );
  }
}

class AddMcDonalds extends StatelessWidget {
  const AddMcDonalds({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('맥도날드','맥도날드', 'jpg'),
        ],
      ),
    );
  }
}

class AddBBQ extends StatelessWidget {
  const AddBBQ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('bbq','bbq', 'jpg'),
        ],
      ),
    );
  }
}

class AddKyochon extends StatelessWidget {
  const AddKyochon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('교촌치킨','교촌치킨', 'png'),
        ],
      ),
    );
  }
}

class AddTous extends StatelessWidget {
  const AddTous({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset('lib/images/뚜레쥬르 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('뚜레쥬르','CJ ONE', 'jpg'),
          AddMembershipHelper('뚜레쥬르','T', 'png'),
          AddMembershipHelper('뚜레쥬르','kt', 'jpg'),
          AddMembershipHelper('뚜레쥬르','U+', 'jpg'),
        ],
      ),
    );
  }
}

class Add711 extends StatelessWidget {
  const Add711({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset('lib/images/세븐일레븐 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('7 11','T', 'png'),
          AddMembershipHelper('7 11','L Point', 'png'),
        ],
      ),
    );
  }
}

class AddMinistop extends StatelessWidget {
  const AddMinistop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset('lib/images/미니스톱 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('Ministop','OK캐쉬백', 'png'),
        ],
      ),
    );
  }
}

class AddGS extends StatelessWidget {
  const AddGS({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset('lib/images/GS25 헤더.png', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('GS25','kt', 'jpg'),
          AddMembershipHelper('GS25','U+', 'jpg'),
          AddMembershipHelper('GS25','기아멤버스', 'png'),
        ],
      ),
    );
  }
}

class AddCU extends StatelessWidget {
  const AddCU({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('CU','CU', 'jpg'),
          AddMembershipHelper('CU','T', 'jpg'),
        ],
      ),
    );
  }
}

class AddGongcha extends StatelessWidget {
  const AddGongcha({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('공차','공차', 'jpg'),
          AddMembershipHelper('공차','T', 'jpg'),
        ],
      ),
    );
  }
}

class AddSulbing extends StatelessWidget {
  const AddSulbing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('설빙','설빙', 'jpg'),
        ],
      ),
    );
  }
}

class AddEdiya extends StatelessWidget {
  const AddEdiya({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('이디야','이디야', 'jpg'),
        ],
      ),
    );
  }
}

class AddTwosome extends StatelessWidget {
  const AddTwosome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset('lib/images/투썸 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('투썸','CJ ONE', 'jpg'),
          AddMembershipHelper('투썸','T', 'png'),
          AddMembershipHelper('투썸','kt', 'jpg'),
          AddMembershipHelper('투썸','U+', 'jpg'),
        ],
      ),
    );
  }
}
*/