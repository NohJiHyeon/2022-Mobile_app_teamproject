import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:w3_class/styles.dart';

/*
  커스텀한 floatingActionButton입니다.
  floatingActionButton을 누르면 브랜드 추가/기프티콘 추가 버튼이 애니메이션과 함께 생성됩니다
  다시 floatingActionButton을 누르면 두 버튼이 사라집니다.
 */

class CustomFloatingActionButton extends StatefulWidget {
  @override
  _CustomFloatingActionButton createState() => _CustomFloatingActionButton();
}

class _CustomFloatingActionButton extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // 처음 상태에서 보여지는 버튼
      marginBottom: 10,
      //margin bottom
      icon: Icons.add,
      //icon on Floating action button
      activeIcon: Icons.close,
      //icon when menu is expanded on button
      backgroundColor: AppColor.ORANGE,
      //background color of button
      foregroundColor: Colors.white,
      //font color, icon color in button
      activeBackgroundColor: AppColor.BRIGHT_GRAY,
      //background color when menu is expanded
      activeForegroundColor: Colors.white,
      buttonSize: 56.0,
      //button size
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.grey,
      overlayOpacity: 0.5,
      elevation: 8.0,
      //shadow elevation of button
      shape: const CircleBorder(),
      //shape of button

      children: [
        SpeedDialChild(
          //speed dial child
          child: const Icon(Icons.add_photo_alternate_outlined),
          backgroundColor: AppColor.ORANGE,
          foregroundColor: Colors.white,
          label: '기프티콘 추가하기',
          labelStyle: const TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          onTap: () => {
            Navigator.pushNamed(context, '/gifticon_add')
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.work_rounded),
          backgroundColor: AppColor.ORANGE,
          foregroundColor: Colors.white,
          label: '브랜드 추가하기',
          labelStyle: const TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          onTap: () => print('브랜드 추가 화면으로 이동'),
        ),
      ],
    );
  }
}
