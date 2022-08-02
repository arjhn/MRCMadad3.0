import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/models/model_messages_details.dart';
import 'package:mrc_madad_3/providers/provider_message_mockup.dart';
import 'package:mrc_madad_3/ui/chat/chat_body.dart';
import 'package:provider/provider.dart';

class ChatMainScreen extends StatefulWidget {

  final List<MessagesModel> messageData;

  const ChatMainScreen({
    Key? key,
    required this.messageData
  }) : super(key: key);

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {

  @override
  void initState(){
    super.initState();
    Provider.of<ProviderMessageMockup>(context,listen: false).setCompQuestionnaire(widget.messageData);
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          title: buildAppBarTitle(),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          /** actions: [
            Builder(
              builder: (context) => IconButton(
                    onPressed: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(Icons.menu_open,color:Colors.black,size: 40,)
                ),
            )
          ],**/
        ),
      ),
      endDrawer: buildEndDrawer(),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_letters_tint.png'),
            fit: BoxFit.cover
          )
        ),
          child: ChatBody()
      )
    );
  }

  //================================================================================================================================================

  Drawer buildEndDrawer() {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 5,
            child: Container(
              color: Color.fromRGBO(32, 39, 49,1),
            ),
          ),
          SizedBox(height: 10,),
          for(var i=0;i<10;i++)
            buildDrawerRows('Date of Birth')
        ],
      ),
    );
  }

  //============================================================================================================================================

  Padding buildDrawerRows(String textValue) {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(textValue,style: TextStyle(
                      fontFamily: 'Brandon Grotesque',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color.fromRGBO(109, 96, 98,1)
                  ),),
                  Expanded(child: SizedBox()),
                  Icon(Icons.check_circle,color: Color.fromRGBO(109, 96, 98,1),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(color: Colors.grey,thickness: 1,),
              )
            ],
          ),
        );
  }

  //===============================================================================================================================================

  Row buildAppBarTitle() {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            radius: 15,
          ),
          SizedBox(width: 20,),
          Text('Hero', style: TextStyle(
            color: Colors.black
          ),),
        ],
      );
  }
}
