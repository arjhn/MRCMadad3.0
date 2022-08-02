import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleAppBar{
  Map<String,dynamic> get StyleOfAppBar=>{
    'en':TextStyle(
      fontFamily: 'Noto Serif',
      fontSize: 25,
      color: Colors.black
      //Color.fromRGBO(229, 45, 75,1)
    ),
    'te':TextStyle(
      fontFamily: 'Noto Serif Telugu',
        fontSize: 25,
        color: Colors.black
    ),
    'ta':TextStyle(
      fontFamily: 'Hind Madurai',
        fontSize: 25,
        color: Colors.black
    ),
    'hi':TextStyle(
      fontFamily: 'Eczar',
        fontSize: 25,
        color: Colors.black
    ),
    'ml':TextStyle(
      fontFamily: 'Noto Serif Malayalam',
        fontSize: 25,
        color: Colors.black
    ),
    'kn':TextStyle(
      fontFamily: 'Noto Serif Kannada',
        fontSize: 25,
        color: Colors.black
    )
  };
}