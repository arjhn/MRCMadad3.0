import 'package:flutter/material.dart';

class TextStyleAccountEdit{

  Map<String,dynamic> get styleOfAccountEdit=>{
    'en':TextStyle(
        fontFamily: 'Noto Serif',
        fontSize: 20,
        color: Colors.black.withOpacity(0.8)
    ),
    'te':TextStyle(
        fontFamily: 'Noto Serif Telugu',
        fontSize: 25,
        color: Colors.black.withOpacity(0.8)
    ),
    'ta':TextStyle(
        fontFamily: 'Hind Madurai',
        fontSize: 20,
        color: Colors.black.withOpacity(0.8)
    ),
    'hi':TextStyle(
        fontFamily: 'Eczar',
        fontSize: 25,
        color: Colors.black.withOpacity(0.8)
    ),
    'ml':TextStyle(
        fontFamily: 'Noto Serif Malayalam',
        fontSize: 25,
        color: Colors.black.withOpacity(0.8)
    ),
    'kn':TextStyle(
        fontFamily: 'Noto Serif Kannada',
        fontSize: 22,
        color: Colors.black.withOpacity(0.8)
    )
  };

}