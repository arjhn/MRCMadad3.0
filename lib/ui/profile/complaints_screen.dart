import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_app_bar.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/providers/provider_news.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  _ComplaintsScreenState createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {

  late Size size;

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;

    return Consumer<ProviderLocale>(
        builder: (context, refOfProviderLocale,_) {
          return Consumer<ProviderNews>(
              builder: (context, refOfProviderNews,_) {
                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(45),
                    child: buildAppBar(context,refOfProviderLocale),
                  ),
                  backgroundColor: Colors.white,
                );
              }
          );
        }
    );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++App Bar Contents++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  AppBar buildAppBar(BuildContext context,ProviderLocale refOfProviderLocale) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.6)
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)?.profileAppBarHeading ?? 'Profile',
              style: TextStyleAppBar().StyleOfAppBar[refOfProviderLocale.appLocale.toString()]
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 2,
      actions: [
        Container(
          width: 14,
          height: 45,
          color: Colors.black,
        ),
      ],
    );
  }
}
