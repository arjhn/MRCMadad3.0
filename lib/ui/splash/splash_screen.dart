import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mrc_madad_3/router/swipe_navigation.dart';
import 'package:mrc_madad_3/ui/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late AnimationController _opacityAnimationController;
  late Animation<double> _opacityAnimaiton;
  bool userPresent=false;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(vsync: this);
    _opacityAnimationController=AnimationController(vsync: this,duration: Duration(milliseconds: 2800))
      ..forward();
    _opacityAnimaiton=CurvedAnimation(parent: _opacityAnimationController, curve: Curves.easeIn);
  }

  @override
  void dispose(){
    _animationController.dispose();
    _opacityAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: _buildLogo(context),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:_buildFooter()
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth:MediaQuery.of(context).size.width*0.8
          ),
          child: Lottie.asset(
              'assets/lotties/bird_animation.json',
              controller: _animationController,
              onLoaded: (composition){
                _animationController
                  ..duration=Duration(milliseconds: 2800)
                  ..forward();
              }
          ),
        ),
        FadeTransition(
          opacity: _opacityAnimaiton,
            child: _buildLogoText()
        )
      ],
    );
  }

  Widget _buildLogoText(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'A ',
          style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 20,
              color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Migrants Rights Council (MRC)',
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(229, 45, 75, 1)
              ),
            ),
            TextSpan(
              text: ' - \n Initiative ',
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                  color: Colors.black
              ),
            )
          ]
      ),
    );
  }

  Widget _buildFooter(){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            heightFactor: 0.8,
            child: Image.asset(
                'assets/images/icon_bake.png',
              height: 50,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Baked with Love',
                style: TextStyle(
                  fontFamily: 'Brandon Grotesque',
                  fontSize: 20,
                  color: Colors.black
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n by \n',
                    style: TextStyle(
                        fontFamily: 'Brandon Grotesque',
                        fontSize: 20,
                        color: Colors.black,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  TextSpan(
                    text: 'Palamoori Inck,Palamuru,India',
                    style: TextStyle(
                      fontFamily: 'Brandon Grotesque',
                      fontSize: 20,
                      color: Colors.black
                    ),
                  )
                ]
              )
          )
        ],
      ),
    );
  }

}
