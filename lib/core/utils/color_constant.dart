import 'package:flutter/material.dart';

class ColorConstant {
  static Color amber700 = Colors.amber[700]!;

  static Color green200 = fromHex('#9de6ad');

  static Color deepPurple8007e = fromHex('#7e3b14aa');

  static Color deepPurple800 = fromHex('#3a13aa');

  static Color green4007e = fromHex('#7e45ea69');

  static Color gray900Ab = fromHex('#ab1d1d1f');

  static Color black9003f = fromHex('#3f000000');

  static Color deepPurple300 = fromHex('#8471e7');

  static Color green400 = fromHex('#45e969');

  static Color black900 = fromHex('#000000');

  static Color green40087 = fromHex('#8745e969');

  static Color blueGray3004c = fromHex('#4c9a9dac');

  static Color blueGray700 = fromHex('#51535d');

  static Color blueGray70019 = fromHex('#1951535d');

  static Color blueGray900 = fromHex('#382c2d');

  static Color redA20001 = fromHex('#ff4949');

  static Color gray700 = fromHex('#5d635f');

  static Color blueGray400 = fromHex('#8b8a92');

  static Color blueGray300 = fromHex('#a5a8b0');

  static Color redA200 = fromHex('#ff6262');

  static Color gray900 = fromHex('#1d1d1f');

  static Color gray300 = fromHex('#dcdee3');

  static Color gray100 = fromHex('#f3f6f4');

  static Color black90099 = fromHex('#99000000');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color blueGray70001 = fromHex('#525353');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
