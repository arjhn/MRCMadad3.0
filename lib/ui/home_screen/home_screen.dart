import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:mrc_madad_3/constants/enums/enum_news_fetch.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_app_bar.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/providers/provider_news.dart';
import 'package:mrc_madad_3/ui/bottom_bar/bottom_bar_main.dart';
import 'package:mrc_madad_3/ui/complaints_screen/complaints_screen.dart';
import 'package:mrc_madad_3/ui/dialog_boxes/dialog_box_preferences.dart';
import 'package:mrc_madad_3/ui/home_screen/home_screen_drawer.dart';
import 'package:mrc_madad_3/ui/tiles/news_tiles.dart';
import 'package:mrc_madad_3/ui/tiles/shimmer_news_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
              body:buildListViewNews(refOfProviderNews,context) ,
              floatingActionButton:  buildFloatingActionButton(context),
            );
          }
        );
      }
    );

  }

  ElevatedButton buildFloatingActionButton(BuildContext context) {
    return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.red
              ),
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child:Lottie.asset('assets/lotties/siren.json'),
              ),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,_){
                  return ComplaintsMainScreen();
                },
                  opaque: false,
                ));
              },
            );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++App Bar Contents+++++++++++++++++++++++++++++++++++++++++++++++++++

  AppBar buildAppBar(BuildContext context,ProviderLocale refOfProviderLocale) {
    return AppBar(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 14,
                      height: 45,
                      color: Colors.black,
                    ),
                    SizedBox(width: 30,),
                    Text(AppLocalizations.of(context)?.homeAppBarHeading ?? 'Home',
                        style: TextStyleAppBar().StyleOfAppBar[refOfProviderLocale.appLocale.toString()]
                    ),
                  ],
                ),
                titleSpacing: 0,
                backgroundColor: Colors.white,
                elevation: 2,
                actions: [
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                      onPressed: (){

                      },
                      icon: Icon(Icons.notifications,color: Colors.black.withOpacity(0.6),)
                  ),
                  IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      onPressed: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return DialogBoxPreferences();
                              }
                          );
                      },
                      icon: Icon(Icons.settings_suggest,color: Colors.black.withOpacity(0.6),)
                  )
                ],
              );
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Scaffold Body Contents([)++++++++++++++++++++++++++++++++++++++++++++++++++++

  ListView buildListViewNews(ProviderNews refOfProviderNews,BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,int index)=>
        (refOfProviderNews.enumNewsFetch==EnumNewsFetch.Complete)? Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNewsCardTile(refOfProviderNews, index),
              Divider(thickness: 2,)
            ],
          ),
        ) :ShimmerNewsTile(),
      itemCount:(refOfProviderNews.enumNewsFetch==EnumNewsFetch.Complete)?refOfProviderNews.newByLanguage['en']!.length:5,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
    );
  }

  NewsCardTile buildNewsCardTile(ProviderNews refOfProviderNews, int index) {
    return NewsCardTile(
          imageURL: refOfProviderNews.newByLanguage['en']![index].imageURL ?? '',
          title: refOfProviderNews.newByLanguage['en']![index].title ?? '',
          description: refOfProviderNews.newByLanguage['en']![index].description ?? '',
          postURL: refOfProviderNews.newByLanguage['en']![index].url ?? '',
          dateString: refOfProviderNews.newByLanguage['en']![index].dateString ?? '',
          publisher: refOfProviderNews.newByLanguage['en']![index].publisher ?? '',
          language: refOfProviderNews.newByLanguage['en']![index].language ?? '');
  }
}
