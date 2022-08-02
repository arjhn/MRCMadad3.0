import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/ui/bottom_bar/bottom_bar_main.dart';
import 'package:mrc_madad_3/ui/bottom_bar/bottom_bar_main_screen.dart';
import 'package:mrc_madad_3/ui/bottom_bar/solomon_bar.dart';
import 'package:mrc_madad_3/ui/home_screen/home_screen.dart';
import 'package:mrc_madad_3/ui/profile/profile_main.dart';

class ConnectorScreen extends StatefulWidget {
  const ConnectorScreen({Key? key}) : super(key: key);

  @override
  _ConnectorScreenState createState() => _ConnectorScreenState();
}

class _ConnectorScreenState extends State<ConnectorScreen> {

  int _homeWidgetIndex=0;

  List<Widget> _widgetElements=<Widget>[
    HomeScreen(),
    ProfileMainScreen()
  ];

  Map<String,dynamic> userDetails={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  IndexedStack(
        children: <Widget>[
          HomeScreen(),
          ProfileMainScreen()
        ],
        index: _homeWidgetIndex,
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _homeWidgetIndex,
          onTap: (i) {
            setState(() => _homeWidgetIndex = i);
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Color.fromRGBO(18, 18, 18, 1),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.perm_identity),
              title: Text("Profile"),
              selectedColor: Color.fromRGBO(18, 18, 18, 1),
            ),
          ]
      ),
    );
  }
}
