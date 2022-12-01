import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../gifticon/barcode_scan.dart';
import '../gifticon/image_picker.dart';

class AddTester extends StatelessWidget {
  const AddTester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('브랜드 등록하기'),
      ),
      body: const AddMegabox(),
    );
  }
}

Widget AddMembershipHelper(String brand, String format) {
  return Column(
    children: [
      Image.asset('lib/images/$brand 헤더.$format', width: 700),
      const SizedBox(
        height: 20,
      ),
      Text('$brand 멤버십 바코드 이미지'),
      const SizedBox(
        height: 20,
      ),
      ImagePick(),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

class AddMegabox extends StatelessWidget {
  const AddMegabox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          Image.asset('lib/images/메가박스 헤더.jpg', width: 700),
          const SizedBox(
            height: 20,
          ),
          AddMembershipHelper('kt', 'jpg'),
          AddMembershipHelper('U+', 'jpg'),
          AddMembershipHelper('L Point', 'png'),
          AddMembershipHelper('OK캐쉬백', 'png'),
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
          AddMembershipHelper('kt', 'jpg'),
          AddMembershipHelper('U+', 'jpg'),
          AddMembershipHelper('OK캐쉬백', 'png'),
          AddMembershipHelper('기아멤버스', 'png'),
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
          AddMembershipHelper('T', 'png'),
          AddMembershipHelper('kt', 'jpg'),
          AddMembershipHelper('OK캐쉬백', 'png'),
          AddMembershipHelper('기아멤버스', 'png'),
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
          AddMembershipHelper('버거킹', 'jpg'),
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
          AddMembershipHelper('맥도날드', 'jpg'),
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
          AddMembershipHelper('bbq', 'jpg'),
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
          AddMembershipHelper('교촌치킨', 'png'),
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
          AddMembershipHelper('CJ ONE', 'jpg'),
          AddMembershipHelper('T', 'png'),
          AddMembershipHelper('kt', 'jpg'),
          AddMembershipHelper('U+', 'jpg'),
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
          AddMembershipHelper('T', 'png'),
          AddMembershipHelper('L Point', 'png'),
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
          AddMembershipHelper('OK캐쉬백', 'png'),
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
          AddMembershipHelper('kt', 'jpg'),
          AddMembershipHelper('U+', 'jpg'),
          AddMembershipHelper('기아멤버스', 'png'),
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
          AddMembershipHelper('CU', 'jpg'),
          AddMembershipHelper('T', 'jpg'),
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
          AddMembershipHelper('공차', 'jpg'),
          AddMembershipHelper('T', 'jpg'),
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
          AddMembershipHelper('설빙', 'jpg'),
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
          AddMembershipHelper('이디야', 'jpg'),
        ],
      ),
    );
  }
}

class AddStarbucks extends StatelessWidget {
  const AddStarbucks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          AddMembershipHelper('스타벅스', 'jpg'),
          AddMembershipHelper('kt', 'jpg'),
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
          AddMembershipHelper('CJ ONE', 'jpg'),
          AddMembershipHelper('T', 'png'),
          AddMembershipHelper('kt', 'jpg'),
          AddMembershipHelper('U+', 'jpg'),
        ],
      ),
    );
  }
}
