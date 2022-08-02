import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mrc_madad_3/providers/provider_authentication.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/providers/provider_message_mockup.dart';
import 'package:mrc_madad_3/providers/provider_news.dart';
import 'package:mrc_madad_3/providers/provider_user_details.dart';
import 'package:mrc_madad_3/ui/audio_mixins/audio_player_main.dart';
import 'package:mrc_madad_3/ui/chat/chat_main_screen.dart';
import 'package:mrc_madad_3/ui/chat/record_check.dart';
import 'package:mrc_madad_3/ui/experiment/experiment_audio_input.dart';
import 'package:mrc_madad_3/ui/experiment/experiment_draggable.dart';
import 'package:mrc_madad_3/ui/landing_screen/landing_screen.dart';
import 'package:mrc_madad_3/ui/main_screen/main_screen.dart';
import 'package:mrc_madad_3/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<ProviderAuthentication>(
                create: (context)=>ProviderAuthentication()
            ),
            ChangeNotifierProvider<ProviderUserDetails>(
                create: (context)=>ProviderUserDetails()
            ),
            ChangeNotifierProvider<ProviderLocale>(
                create: (context)=>ProviderLocale()
            ),
            ChangeNotifierProvider<ProviderMessageMockup>(
                create: (context)=>ProviderMessageMockup()
            ),
            ChangeNotifierProvider<ProviderNews>(
                create: (context)=>ProviderNews()
            )
          ],
        child:FirstWidget()
      )
  );
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ProviderLocale>(
      builder: (context, refOfProviderLocale,_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: refOfProviderLocale.appLocale,
            home: LandingScreen()
          );
      }
    );

  }
}
