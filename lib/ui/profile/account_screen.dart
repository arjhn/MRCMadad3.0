import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_account_edit.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_app_bar.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_profile_tile.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/providers/provider_news.dart';
import 'package:mrc_madad_3/providers/provider_user_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

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
                  body: buildProfileBody(refOfProviderLocale),
                );
              }
          );
        }
    );
  }

  Consumer buildProfileBody(ProviderLocale refOfProviderLocale) {
    return Consumer<ProviderUserDetails>(
      builder: (context, refOfProviderUserDetails,_) {
        return ListView(
                      children: [
                        SizedBox(height: size.height*0.05,),
                        buildCircularEditAvatar(refOfProviderUserDetails),
                        buildEditSections(refOfProviderLocale,refOfProviderUserDetails.userData['displayName'],'Name'),
                        buildEditSections(refOfProviderLocale, refOfProviderUserDetails.userData['phoneNumber'], 'Phone Number'),
                        buildEditSections(refOfProviderLocale, '', 'Native City/Town/Village'),
                        buildEditSections(refOfProviderLocale, '', 'Native District'),
                        buildEditSections(refOfProviderLocale, '', 'Native State'),
                        buildEditSections(refOfProviderLocale, '', 'Occupation'),
                        buildEditSections(refOfProviderLocale, '', 'Company of Work'),
                        buildEditSections(refOfProviderLocale, '', 'City of Work'),
                        buildEditSections(refOfProviderLocale, '', 'Country of Work'),
                        Center(
                          child: ElevatedButton(
                              onPressed: (){

                              },
                              child: Text('Save')
                          ),
                        )
                      ],
                    );
      }
    );
  }

  Padding buildEditSections(ProviderLocale refOfProviderLocale,String initialValue,String sectionName) {
    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(sectionName,style: TextStyleAccountEdit().styleOfAccountEdit[refOfProviderLocale.appLocale.toString()],),
                            TextFormField(
                              initialValue: initialValue,
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(222, 229, 223, 0.5),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white)
                                )
                              ),
                            )
                          ],
                        ),
                      );
  }

  //------------------------------------------------------------------Circular Avatar Profile Pic----------------------------------------------------------

  GestureDetector buildCircularEditAvatar(ProviderUserDetails refOfProviderUserDetails) {
    return GestureDetector(
      onTap: (){

      },
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 5
                    )
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: refOfProviderUserDetails.userData['profilePicURL']==''?Container():Image.network(refOfProviderUserDetails.userData['profilePicURL'],fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child: Icon(Icons.edit,color: Colors.black,size: 20,),
              ),
            ),
          ],
        ),
      ),
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
          Text(AppLocalizations.of(context)?.profileAppBarHeading ?? 'Account Details',
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
