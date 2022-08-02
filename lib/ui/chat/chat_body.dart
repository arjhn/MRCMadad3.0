import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mrc_madad_3/constants/enums/enum_messages_response_type.dart';
import 'package:mrc_madad_3/models/model_messages_details.dart';
import 'package:mrc_madad_3/providers/provider_message_mockup.dart';
import 'package:mrc_madad_3/services/service_audio_recording.dart';
import 'package:mrc_madad_3/ui/audio_mixins/audio_player_main.dart';
import 'package:mrc_madad_3/ui/chat/chat_input_message.dart';
import 'package:provider/provider.dart';



class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> with TickerProviderStateMixin{

  List<MessagesModel> totalMessages=[];
  final GlobalKey<AnimatedListState> listKey=GlobalKey<AnimatedListState>();

  late AnimationController _animationController;
  bool _isPlaying=false;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(vsync: this);
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: buildMessageList(context)
        ),
        InputMessage()
      ],
    );
  }

  Widget buildMessageList(BuildContext context){

    Size size=MediaQuery.of(context).size;
    Tween<Offset> _listOffset=Tween(begin: Offset(1,0),end: Offset(1,0));


    return Consumer<ProviderMessageMockup>(
      builder: (context,refOfProviderMessageMockup,_) {

        return ListView.builder(
          itemCount:refOfProviderMessageMockup.totalList.length,
            physics: BouncingScrollPhysics(),
            reverse: true,
            itemBuilder: (context,index){
            int reverseIndex=refOfProviderMessageMockup.totalList.length-1-index;
              return buildMessageBubble(size, refOfProviderMessageMockup, reverseIndex);
            }
        );
      }
    );
  }

  //========================================================================================================================================================

  Padding buildMessageBubble(Size size, ProviderMessageMockup refOfProviderMessageMockup, int index) {

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: refOfProviderMessageMockup.totalList[index].isHero ?
        buildHeroMessage(refOfProviderMessageMockup.totalList[index].message,size,refOfProviderMessageMockup,index):
        buildUserMessage(refOfProviderMessageMockup.totalList[index],size)
    );
  }

  Row buildHeroMessage(String message,Size size,ProviderMessageMockup refOfProviderMessageMockup,int index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.redAccent,
          radius: 15,
        ),
        SizedBox(width: 10,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20) ,
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      topLeft: Radius.zero
                  ),
                  color: Color.fromRGBO(242, 242, 242,1)
              ),
              child:ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width*0.65),
                  child: message=='...'? buildLottieTextLoading()
                  :Text(message,textAlign: TextAlign.start,)
              ) ,
            ),
          ],
        )
      ],
    );
  }

  Widget buildLottieTextLoading(){
    return Container(
      height: 30,
      child: Lottie.asset(
          'assets/lotties/message_loading_2.json',
          controller: _animationController,
          onLoaded: (composition){
            _animationController
              ..duration=Duration(milliseconds: 1000)
              ..repeat();
        }
      ),
    );
  }

  Row buildUserMessage(MessagesModel messageDetails,Size size){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.zero ,
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)
              ),
              color: Color.fromRGBO(154, 207, 221, 0.8)
          ),
          child:ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width*0.7),
              child:  (messageDetails.enumResponseType==EnumResponseType.UserResponseRecording)?
              buildAudioMessage(messageDetails):
              (messageDetails.enumResponseType==EnumResponseType.UserResponseImage)?
                  buildImageMessage(messageDetails):
              Text(messageDetails.message,textAlign: TextAlign.end,)
          ) ,
        ),
      ],
    );
  }

  Widget buildAudioMessage(MessagesModel messageDetails){

    return AudioPlayerMain(
      localFile:true,
      filePath:messageDetails.message,
      //'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'
    );
  }

  Widget buildImageMessage(MessagesModel messageDetails){
    return Container(
      child: Image.file(File(messageDetails.message),fit: BoxFit.cover,),
    );
  }

}
