import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleProfileTile{
  Map<String,dynamic> get styleOfProfileTile=>{
    'en':TextStyle(
        fontFamily: 'Brandon Grotesque',
        fontSize: 23,
        color: Colors.black,

      //Color.fromRGBO(229, 45, 75,1)
    ),
    'te':TextStyle(
        fontFamily: 'Noto Serif Telugu',
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500
    ),
    'ta':TextStyle(
        fontFamily: 'Hind Madurai',
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500
    ),
    'hi':TextStyle(
        fontFamily: 'Eczar',
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500
    ),
    'ml':TextStyle(
        fontFamily: 'Noto Serif Malayalam',
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500
    ),
    'kn':TextStyle(
        fontFamily: 'Noto Serif Kannada',
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500
    )
  };
}