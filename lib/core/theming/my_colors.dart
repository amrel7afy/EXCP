import 'package:flutter/material.dart';

abstract class MyColors{
  static const  kPrimaryColor=Color(0xff000000);
  static const  kBlackColor=Color(0xff242424);

  static const  kMoreGreyColor=Color(0xff616161);
  static const    kGreenColor=Color(0xff24A19D);

  static const  kWhiteColor=Color(0xffF4F8FF);
  static const  kGreyColor=Color(0xff757575);
  static const  kLightGreyColor=Color(0xffC2C2C2);
  static const  kLighterGreyColor=Color(0xffEDEDED);
  static const  kMostLighterGreyColor=Color(0xffFDFDFF);
  static const  kRedColor=Color(0xffFF4C5E);


  static const int primaryValue = 0xFF247CFF;
  static const MaterialColor kMapPrimaryColor = MaterialColor(
    primaryValue,
    <int, Color>{
      50: Color(0xFFE8E9F2),
      100: Color(0xFFC5C7E0),
      200: Color(0xFFA1A4CE),
      300: Color(0xFF7D80BC),
      400: Color(0xFF5A5DBA),
      500: Color(primaryValue),
      600: Color(0xFF44489D),
      700: Color(0xFF3A3E8C),
      800: Color(0xFF30357B),
      900: Color(0xFF26296A),
    },
  );
}