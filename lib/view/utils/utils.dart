import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//------------------------------------------------------------ Color
//--------------------------------------------------------------------
const Color darkHeaderClr = Color(0xFF424242);
const Color darkGreyClr = Color(0xFF121212);
//
const primaryClr = bluishClr;
const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;

//--------------------------
const g1 = Color(0xFFF8F9FA);
const g2 = Color(0xFFE9ECEF);
const g3 = Color(0xFFDEE2E6);
const g4 = Color(0xFFCED4DA);
const g5 = Color(0xFFADB5BD);
const g6 = Color(0xFF343A40);
const g7 = Color(0xFF212529);
//------------------------------------------------------------ Themes
//--------------------------------------------------------------------

class Themes {
  static final themeApp = ThemeData(
      //--------------- font
      fontFamily: "f1",

      //--------------- appBar
      appBarTheme: const AppBarTheme(
        backgroundColor: darkGreyClr,
        centerTitle: true,
        elevation: 5,
        shadowColor: bluishClr,
        iconTheme: IconThemeData(color: bluishClr, size: 30),
      ),

      //--------------- floatinButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: bluishClr,
      ));
}

//------------------------------------------------------------ textStyle
//----------------------------------------------------------------------

TextStyle custumTextStyle(double size,
    [Color? color, FontWeight? fw, String? ff]) {
  return TextStyle(
      fontSize: size, color: color, fontWeight: fw, fontFamily: ff);
}

TextStyle get body2Style {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
    ),
  );
}
