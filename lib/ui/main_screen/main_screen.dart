import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mrc_madad_3/constants/variables/constant_variable.dart';
import 'package:mrc_madad_3/providers/provider_authentication.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/router/swipe_navigation.dart';
import 'package:mrc_madad_3/ui/home_screen/home_screen.dart';
import 'package:mrc_madad_3/ui/landing_screen/landing_screen.dart';
import 'package:mrc_madad_3/ui/reusable_components/drop_down_underline.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{

  late AnimationController _animationController;
  List<String> _listLanguage=['English','हिंदी','తెలుగు','മലയാളം','தமிழ்','ಕನ್ನಡ'];
  late TextEditingController _dropDownController;
  bool userPresent=false;
  Map<String,String> valMap={
    'English':'en',
    'हिंदी':'hi',
    'മലയാളം':'ml',
    'తెలుగు':'te',
    'தமிழ்':'ta',
    'ಕನ್ನಡ':'kn'
  };
  int indexSwipe=0;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(vsync: this);
    _dropDownController=TextEditingController();
    initAwait();
  }

  @override
  void dispose(){
    _animationController.dispose();
    _dropDownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover
            )
          ),

          child: _buildMainScreen(context),
        ),
      ),
    );
  }

  Widget _buildMainScreen(BuildContext context){
    return Consumer<ProviderLocale>(
      builder: (context, refOfProviderLocale,_) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    _buildRotatedText(),
                  ],
                )
              ),
            ),
            Align(
              alignment: Alignment(-0.3,-0.25),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth:MediaQuery.of(context).size.width*0.9
                ),
                child: Image.asset('assets/images/icon.png')
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _buildFooter2(context),
              ),
            )
          ],
        );
      }
    );
  }

  Widget _buildFooter2(BuildContext context){

    List<Widget> _screenWidget=[
      _firstSwipeScreen(context),
      _secondSwipeScreen(context)
    ];

    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height*0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
          width: 1.5
        ),
        borderRadius: BorderRadius.all(Radius.circular(25))
      ),
      child: _screenWidget[indexSwipe]
    );
  }

  Widget _firstSwipeScreen(BuildContext context){
    return Consumer<ProviderLocale>(
      builder: (context, refOfProviderLocale,_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildFadeText(),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(163, 205, 217, 0.2),
              ),
              child: DropDownUnderLine(
                  dropField: _listLanguage,
                  controllerDDT: _dropDownController,
                  labelTextString:'Language',
                  dropDownVal: ConstantVariables().reverseValMap[refOfProviderLocale.appLocale.toString()] ?? 'English',
                  callOnChange: (String value){
                    refOfProviderLocale.setAppLocale(valMap[value] ?? 'en');
                  }
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    indexSwipe=1;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  fixedSize: Size(55,55),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(109, 96, 98,1),)
            )
          ],
        );
      }
    );
  }


  Widget _secondSwipeScreen(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)?.mainScreenStartHeading ?? 'Let\'s Get Started',style: TextStyle(
            fontFamily: 'Brandon Grotesque',
            fontWeight: FontWeight.w500,
            fontSize: 34,
            color: Color.fromRGBO(229, 45, 75, 1)
        ),),
        SizedBox(height: 5,),
        Text(AppLocalizations.of(context)?.mainScreenHeadingFooter ?? 'Welcome to MRC MADAD App. \n Kindly Login below',style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 20,
            fontWeight: FontWeight.w100,
            color: Color.fromRGBO(79, 65, 67, 1)
        ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20,),
        _buildGoogleSignIn()
      ],
    );
  }

  Widget _buildGoogleSignIn(){
    return Consumer<ProviderAuthentication>(
      builder: (context, providerAuthenticationRef,_) {
        return ElevatedButton(
            onPressed: (){
              providerAuthenticationRef.signInWithGoogle();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              primary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/google_icon.png',width: 30,height: 30,),
                SizedBox(width: 10,),
                Text(AppLocalizations.of(context)?.mainScreenButtonSignin ?? 'Sign in with Google',style: TextStyle(
                  fontFamily: 'Franklin Gothic',
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(109, 96, 98,1),
                ),),
              ],
            )
        );
      }
    );
  }

  Widget _buildFadeText(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: MediaQuery.of(context).size.height*0.08,
      child: DefaultTextStyle(
        style: TextStyle(
            color: Color.fromRGBO(229, 45, 75, 1),

        ),
        textAlign: TextAlign.center,
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText('Your Langage ?', textStyle:setRotateText('Brandon Grotesque',35),duration: Duration(milliseconds: 800),),
            FadeAnimatedText('మీ భాష ?',textStyle:setRotateText('Noto Serif Telugu', 35),duration: Duration(milliseconds: 800)),
            FadeAnimatedText('உன்னுடைய மொழி ?',textStyle:setRotateText('Hind Madurai',25),duration: Duration(milliseconds: 800)),
            FadeAnimatedText('നിങ്ങളുടെ ഭാഷ ?', textStyle:setRotateText('Noto Serif Malayalam', 30),duration: Duration(milliseconds: 800)),
            FadeAnimatedText('आपकी भाषा ?',textStyle:setRotateText('Eczar', 35),duration: Duration(milliseconds: 800)),
            FadeAnimatedText('ನಿನ್ನ ಭಾಷೆ ?', textStyle: setRotateText('Noto Serif Kannada', 35),duration: Duration(milliseconds: 800)),
          ],
          repeatForever: true,
        ),
      ),
    );
  }

  Widget _buildRotatedText(){
      return DefaultTextStyle(
        style: TextStyle(
          color: Color.fromRGBO(229, 45, 75, 1)
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText('HELLO!', textStyle:setRotateText('Franklin Gothic', 50),duration: Duration(milliseconds: 800),),
            RotateAnimatedText('హలో!',textStyle:setRotateText('Ramabhadra', 55),duration: Duration(milliseconds: 800)),
            RotateAnimatedText('வணக்கம்!',textStyle:setRotateText('Hind Madurai', 50),duration: Duration(milliseconds: 800)),
            RotateAnimatedText('ഹലോ!', textStyle:setRotateText('Noto Serif Malayalam', 50),duration: Duration(milliseconds: 800)),
            RotateAnimatedText('नमस्कार!',textStyle:setRotateText('Eczar', 50),duration: Duration(milliseconds: 800)),
            RotateAnimatedText('ಹಲೋ!', textStyle: setRotateText('Noto Serif Kannada', 50),duration: Duration(milliseconds: 800)),
          ],
          repeatForever: true,
        ),
      );
  }

  TextStyle setRotateText(String fFamily,double fSize,){
    return TextStyle(
      fontFamily: fFamily,
      fontSize: fSize,
    );
  }

  void initAwait(){
    if(FirebaseAuth.instance.currentUser!=null){
      setState(() {
        userPresent=true;
      });
    }
  }

  TextStyle setTextStyle(String fFamily,double fSize,Color fColor,FontWeight fWeight){

    return TextStyle(
        fontFamily: fFamily,
        fontSize: fSize,
        fontWeight: fWeight,
        color:fColor
    );
  }

}
