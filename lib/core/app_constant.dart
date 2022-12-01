import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant{
  final  gradientStart = Color(0xffFF8F71);
  final  gradientFinal=  Color(0xffEF2D1A);
            
  final title = GoogleFonts.lato(textStyle: TextStyle(fontSize: 23 ,fontWeight: FontWeight.bold, color: Colors.white));
  final text1 = GoogleFonts.lato(textStyle: TextStyle(fontSize: 14, color: Color(0xffbdbdbd), ));
  final text2 = GoogleFonts.lato(textStyle: TextStyle(fontSize: 19, color: Colors.white, ));
  final star = GoogleFonts.lato(textStyle: TextStyle(fontSize: 15, color: Colors.white, ));

  BoxDecoration ImageAndRadius(String path, double radius){
    return BoxDecoration(image: DecorationImage(image: NetworkImage(path),fit: BoxFit.cover), borderRadius: BorderRadius.circular(radius));
  }
}