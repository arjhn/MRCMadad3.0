import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogBoxInfo extends StatefulWidget {
  const DialogBoxInfo({Key? key}) : super(key: key);

  @override
  _DialogBoxInfoState createState() => _DialogBoxInfoState();
}

class _DialogBoxInfoState extends State<DialogBoxInfo> {


  late Size size;

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;

    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: Colors.transparent,
      child: buildPreferencesList(),
    );
  }

  Consumer buildPreferencesList() {
    return Consumer<ProviderLocale>(
        builder: (context, refOfProviderLocale,_) {
          return Center(
            child: Container(
              height: size.height*0.4,
              width: size.height*0.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(
                    FontAwesomeIcons.infoCircle,
                    size: 50,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Version',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                      SizedBox(width: 30,),
                      Text('α2.0.0',style: TextStyle(
                          fontSize: 20
                      ),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(AppLocalizations.of(context)?.accountDetailsMessage ?? 'Hey',
                      style: TextStyle(
                          fontSize: 18
                      )
                      ,textAlign: TextAlign.center,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: (){

                          },
                          icon: FaIcon(FontAwesomeIcons.instagram)
                      ),
                      IconButton(
                          onPressed: (){

                          },
                          icon: FaIcon(FontAwesomeIcons.facebook)
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
