import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarMain extends StatefulWidget {
  const BottomBarMain({Key? key}) : super(key: key);

  @override
  _BottomBarMainState createState() => _BottomBarMainState();
}

class _BottomBarMainState extends State<BottomBarMain> {

  late Size size;

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;

    return Container(
      height: 60,
      color: Colors.transparent,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap:(){

            },
            child: Container(
              width: size.width*0.7,
              height: 60,
              color: Color.fromRGBO(18, 18, 18, 1),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home,color: Colors.white,size: 40,),
                  Text('Home',style: TextStyle(
                    fontFamily: 'Brandon Grotesque',
                    fontSize: 25
                  ),),
                  SizedBox(width:size.width*0.1)
                ],
              ),
              ),
            ),
        ],
      ),
    );

   /** return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: Offset(0,10)
          )
        ],
        color: Colors.white,
      ),
      height: 60,
      margin: EdgeInsets.symmetric(vertical:size.width*0.02,horizontal: size.width*0.1),
    );**/
  }
}
