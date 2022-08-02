import 'package:flutter/material.dart';

class TextStyleAppPreferences{

  Map<String,dynamic> get styleOfAppPreferences=>{
    'en':TextStyle(
        fontFamily: 'Noto Serif',
        fontSize: 20,
        color: Colors.black
    ),
    'te':TextStyle(
        fontFamily: 'Noto Serif Telugu',
        fontSize: 25,
        color: Colors.black
    ),
    'ta':TextStyle(
        fontFamily: 'Hind Madurai',
        fontSize: 20,
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
        fontSize: 22,
        color: Colors.black
    )
  };

}