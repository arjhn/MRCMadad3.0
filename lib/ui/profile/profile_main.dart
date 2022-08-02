import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_app_bar.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_profile_name.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_profile_tile.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/providers/provider_news.dart';
import 'package:mrc_madad_3/providers/provider_user_details.dart';
import 'package:mrc_madad_3/router/swipe_navigation.dart';
import 'package:mrc_madad_3/ui/dialog_boxes/dialog_box_info.dart';
import 'package:mrc_madad_3/ui/dialog_boxes/dialog_box_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mrc_madad_3/ui/profile/account_screen.dart';
import 'package:mrc_madad_3/ui/profile/complaints_screen.dart';
import 'package:provider/provider.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  _ProfileMainScreenState createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {

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
                  body:buildProfileBody(context,refOfProviderLocale)
                );
              }
          );
        }
    );
  }

  Consumer buildProfileBody(BuildContext context,ProviderLocale refOfProviderLocale) {

    Color baseColor = Color(0xFFF2F2F2);

    return Consumer<ProviderUserDetails>(
      builder: (context, refOfProviderUserDetails,_) {
        if(refOfProviderUserDetails.userData['profilePicURL']!=Null){
          print(refOfProviderUserDetails.userData);
          daysCalculator(refOfProviderUserDetails.userData['creationTime']);
          return ListView(
                        children: [
                          SizedBox(height: size.height*0.05,),
                          CircleAvatar(
                              radius:40 ,
                              backgroundColor: Colors.purple,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: refOfProviderUserDetails.userData['profilePicURL']==''?Container():Image.network(refOfProviderUserDetails.userData['profilePicURL'],fit: BoxFit.cover,),
                              )
                          ),
                          SizedBox(height: size.height*0.025,),
                          Text(
                            refOfProviderUserDetails.userData['displayName'],textAlign: TextAlign.center,
                            style: TextStyleProfileName().styleOfProfileName[refOfProviderLocale.appLocale.toString()],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(thickness: 2,color: Colors.redAccent,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Row(
                              children: [
                                Expanded(child: SizedBox(),),
                                buildClayContainer(
                                    daysCalculator(refOfProviderUserDetails.userData['creationTIme'])??'',
                                    'days'),
                                Expanded(child: SizedBox(width: 50,),),
                                buildClayContainer('0','Complaints'),
                                Expanded(child: SizedBox(),)
                              ],
                            ),
                          ),
                          buildTile(refOfProviderLocale,Icons.person_outline,AppLocalizations.of(context)?.profileTilesAccount ?? 'Account',(){
                            Navigator.of(context).push(CustomPageRouteBuilder(child: AccountScreen()));
                          }),
                          buildTile(refOfProviderLocale,Icons.receipt_long,AppLocalizations.of(context)?.profileTilesComplaints ?? 'Complaints',(){
                            Navigator.of(context).push(CustomPageRouteBuilder(child: ComplaintsScreen()));
                          }),
                          buildTile(refOfProviderLocale,Icons.settings_suggest,AppLocalizations.of(context)?.profileTilesSettings ?? 'Settings',(){
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return DialogBoxPreferences();
                                }
                            );
                          }),
                          buildTile(refOfProviderLocale,Icons.info,AppLocalizations.of(context)?.profileTilesAbout ?? 'About',(){
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return DialogBoxInfo();
                                }
                            );
                          }),
                          buildTile(refOfProviderLocale,Icons.logout,AppLocalizations.of(context)?.profileTilesLogout ?? 'Logout',(){}),
                      ],
                    );
        }
        else{
          return CircularProgressIndicator();
        }
      }
    );
  }

  ClayContainer buildClayContainer(String numberHeading,String comments) {
    return ClayContainer(
                              color: Colors.white,
                              curveType:CurveType.concave,
                              height: 80,
                              width: 80,
                              borderRadius: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(numberHeading,style: TextStyle(
                                    fontFamily: 'Abril Fatface',
                                    fontSize: 30
                                  ),),
                                  Text(comments,style: TextStyle(
                                    fontFamily: 'Pacifico',
                                    fontSize: 15
                                  ),)
                                ],
                              ),
                            );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Tile+++++++++++++++++++++++++++++++++++++++++++++++++++

  InkWell buildTile(ProviderLocale refOfProviderLocale,IconData iconData,String tileName, Function() functionCall) {
    return InkWell(
      onTap: functionCall,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(iconData,size: 45,),
            SizedBox(width: 30,),
            Text(tileName, style: TextStyleProfileTile().styleOfProfileTile[refOfProviderLocale.appLocale.toString()],),
            Expanded(child: SizedBox()),
            Icon(Icons.chevron_right,size: 45,)
          ],
        ),
      ),
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
          Text(AppLocalizations.of(context)?.profileAppBarHeading ?? 'Profile',
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
      ],
    );
  }

  String? daysCalculator(String? dateString){
    //DateTime? dateTimeValue=DateTime.parse(??'');
    print(dateString);
    DateTime creationDate=DateTime.parse(dateString??DateTime.now().toString());
    DateTime nowTime=DateTime.now();
    return nowTime.difference(creationDate).inDays.toString();
  }
}


