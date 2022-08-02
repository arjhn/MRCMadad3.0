import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';

class CustomPageRouteBuilder extends PageRouteBuilder{

  final Widget child;
  final AxisDirection? direction;

  CustomPageRouteBuilder({
    required this.child,
    this.direction=AxisDirection.left
  }) : super(
      transitionDuration: Duration(milliseconds: 300),
      reverseTransitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context,animation,secondaryAnimation)=>child
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
          position: Tween<Offset>(
              begin: getBeginOffset(),
              end: Offset.zero
          ).animate(animation),
          child: child
      );

  Offset? getBeginOffset(){
    switch(direction){
      case AxisDirection.right:
        return Offset(-1,0);
      case AxisDirection.left:
        return Offset(1, 0);
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
    }
  }
}