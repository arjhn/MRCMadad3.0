import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/constants/enums/enum_firebase_sign_in.dart';
import 'package:mrc_madad_3/providers/provider_authentication.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/router/swipe_navigation.dart';
import 'package:mrc_madad_3/ui/connector/connector_screen.dart';
import 'package:mrc_madad_3/ui/home_screen/home_screen.dart';
import 'package:mrc_madad_3/ui/main_screen/main_screen.dart';
import 'package:mrc_madad_3/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  bool timeComplete=false;
  bool userPresent=false;

  @override
  void initState(){
    super.initState();
    Provider.of<ProviderLocale>(context,listen: false).appLocale;
    Timer(Duration(milliseconds: 3000), ()=>setState(() {
      timeComplete=true;
    }));
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderAuthentication>(
      builder: (context, refOfProviderAuthentication,_) {
        return FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context,snapshot){
              if(snapshot.hasError)
                return Text('error');
              if(snapshot.connectionState==ConnectionState.done){
                if(timeComplete){
                  if(refOfProviderAuthentication.enumUserPresence==EnumUserPresence.Detected)
                    return ConnectorScreen();
                  else
                    return MainScreen();
                }
              }
              return SplashScreen();
            }
        );
      }
    );
  }

}
