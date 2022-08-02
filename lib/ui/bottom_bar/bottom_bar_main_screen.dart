import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mrc_madad_3/ui/bottom_bar/solomon_bar.dart';

class BottomBar extends StatefulWidget {

  final Function(int) callOnChange;

  const BottomBar({
    Key? key,
    required this.callOnChange
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  late double widthWindow;
  late double heightWindow;
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {

    widthWindow=MediaQuery.of(context).size.width;
    heightWindow=MediaQuery.of(context).size.height;
    bool firstFlag=false;

    return Stack(
      children: [
        Container(
          width: widthWindow,
          child: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (i) {
                setState(() => _currentIndex = i);
                widget.callOnChange(i);
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
        )
      ],
    );
  }
}
