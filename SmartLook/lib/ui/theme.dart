import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


const Color bluishClr = Color(0xFF4e5ae8);
const Color button = Color(0xff5b33a5);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color blackClr = Colors.black;
const Color darkGreyrClr = Color(0xFF121212);


class Themes{

  //tema claro
  static final light= ThemeData(
    backgroundColor: Colors.white,
  primaryColor: primaryClr,
  brightness: Brightness.light
  );


  //tema escuro
  static final dark= ThemeData(backgroundColor: Color(0xff040f15),
  primaryColor: Color(0xff040f15),
  brightness: Brightness.dark
  );
}

//estilização do texto
TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 16,
      //fontWeight: FontWeight.bold,
      //cor da data
      color: Get.isDarkMode?Colors.grey[700]:Colors.grey
    )
  );
}


TextStyle get logTherms{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          //color: Color(0xff6523ac),
        color: Color(0xff7506e3),
      )
  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}

TextStyle get headingStyleLogin{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xff404042),
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color:Get.isDarkMode?Colors.white:Colors.black
    )
  );
}

TextStyle get subtitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color:Get.isDarkMode?Colors.grey[100]:Colors.grey[400]
      )
  );
}
TextStyle get subtitleTermsStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color:Get.isDarkMode?Colors.grey[100]:Colors.grey[400]
      )
  );
}

TextStyle get homeTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color:Get.isDarkMode?Colors.grey[100]:Colors.grey[400]
      )
  );
}

TextStyle get loginTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
         color: Color(0xff6523ac),
      )
  );
}

TextStyle get termosTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color:Get.isDarkMode?Colors.black:Colors.black
      )
  );
}


