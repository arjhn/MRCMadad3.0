import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/providers/provider_user_details.dart';
import 'package:provider/provider.dart';

class HomeScreenDrawer extends StatefulWidget {
  const HomeScreenDrawer({Key? key}) : super(key: key);

  @override
  _HomeScreenDrawerState createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {

  late Size size;

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        children: [
          buildAccountSection()
        ],
      ),
    );
  }

  Widget buildAccountSection() {
    return Consumer<ProviderUserDetails>(
      builder: (context, refOfProviderUserDetails,_) {
        print('details'+refOfProviderUserDetails.userData.toString());
        return Container(
              height: size.height*0.2,
              color: Colors.green,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius:40 ,
                      backgroundColor: Colors.purple,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: refOfProviderUserDetails.userData['profilePicURL']==''?Container():Image.network(refOfProviderUserDetails.userData['profilePicURL'],fit: BoxFit.fill,),
                      )
                  ),
                  SizedBox(height: size.height*0.025,),
                  Text(refOfProviderUserDetails.userData['displayName'],)
                ],
              ),
            );
      }
    );
  }
}
