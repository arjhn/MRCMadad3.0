import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/constants/enums/enum_messages_response_type.dart';
import 'package:mrc_madad_3/models/model_messages_details.dart';
import 'package:mrc_madad_3/providers/provider_message_mockup.dart';
import 'package:mrc_madad_3/router/swipe_navigation.dart';
import 'package:mrc_madad_3/services/service_audio_recording.dart';
import 'package:mrc_madad_3/services/service_calendar_pick.dart';
import 'package:mrc_madad_3/services/service_image_picker.dart';
import 'package:mrc_madad_3/ui/audio_mixins/audio_recorder_main.dart';
import 'package:mrc_madad_3/ui/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class InputMessage extends StatefulWidget {
  const InputMessage({Key? key}) : super(key: key);

  @override
  _InputMessageState createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {

  ServiceAudioRecording _serviceAudioRecording=ServiceAudioRecording();

  @override
  void initState(){
    super.initState();
    _serviceAudioRecording.init();
  }

  @override
  void dispose(){
    super.dispose();
    //_serviceAudioRecording.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildBottomBar();
  }

  Material buildBottomBar() {
    return Material(
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: SafeArea(
          child: buildMessageStrip(),
        ),
      ),
    );
  }

  Widget buildMessageStrip() {

    TextEditingController _messageTypeController=TextEditingController();

    return Consumer<ProviderMessageMockup>(
      builder: (context, refOfProviderMessageMockup,_) {
        if(refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].enumResponseType==EnumResponseType.Custom)
          return buildTextField(_messageTypeController, refOfProviderMessageMockup, context);
        else if(refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].enumResponseType==EnumResponseType.Date)
          return buildDatePickerButton(refOfProviderMessageMockup, context);
        else if(refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].enumResponseType==EnumResponseType.Fixed)
          return buildFixedButton(refOfProviderMessageMockup, context);
        else if(refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].enumResponseType==EnumResponseType.Image)
          return buildImagePickerButton(refOfProviderMessageMockup, context);
        else if(refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].enumResponseType==EnumResponseType.AudioTextInput)
          return AudioRecorderMain(messageTypeController: _messageTypeController, refOfProviderMessageMockup: refOfProviderMessageMockup);
        else if(refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].enumResponseType==EnumResponseType.DialogComplete)
          return buildFixedByeButton(refOfProviderMessageMockup, context);
        else
          return Container();
      }
    );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Row buildTextField(TextEditingController _messageTypeController, ProviderMessageMockup refOfProviderMessageMockup, BuildContext context) {
    return Row(
        children: [
          Expanded(
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child:TextField(
                    controller: _messageTypeController,
                    decoration: InputDecoration(
                        hintText: "Type your Message..",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                    ),
                  )
              )
          ),
          SizedBox(width: 10,),
          InkWell(
            onTap: (){
              refOfProviderMessageMockup.addMessage(MessagesModel(
                  message: _messageTypeController.text, isHero: false, enumResponseType: EnumResponseType.UserResponse
              ));
              _messageTypeController.clear();
              FocusScope.of(context).unfocus();
            },
            child: CircleAvatar(
              radius: 25,
              child: Icon(Icons.send,color: Colors.white),
            ),
          )
        ],
      );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Row buildFixedButton(ProviderMessageMockup refOfProviderMessageMockup, BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)
                ),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.withOpacity(0.7)
                  ),
                  child:Text(
                      refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].responseValue ?? 'Okay !'
                  ) ,
                  onPressed: (){
                    refOfProviderMessageMockup.addMessage(MessagesModel(
                        message: refOfProviderMessageMockup.totalList[refOfProviderMessageMockup.totalList.length-1].responseValue ?? 'Okay !', isHero: false, enumResponseType: EnumResponseType.UserResponse
                    ));
                  },
                )
            )
        ),
      ],
    );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Row buildFixedByeButton(ProviderMessageMockup refOfProviderMessageMockup, BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)
                ),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue.withOpacity(0.7)
                  ),
                  child:Text(
                      'Bye'
                  ) ,
                  onPressed: (){
                    Navigator.of(context).pushReplacement(CustomPageRouteBuilder(child: HomeScreen()));
                  },
                )
            )
        ),
      ],
    );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Row buildDatePickerButton(ProviderMessageMockup refOfProviderMessageMockup, BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)
                ),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue.withOpacity(0.7)
                  ),
                  child:Icon(Icons.calendar_today),
                  onPressed: (){
                    ServiceCalendarPick().datePick(context).then((value){
                      print(value);
                      refOfProviderMessageMockup.addMessage(MessagesModel(
                          message: value, isHero: false, enumResponseType: EnumResponseType.UserResponse
                      ));
                    });
                  },
                )
            )
        ),
      ],
    );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Row buildImagePickerButton(ProviderMessageMockup refOfProviderMessageMockup, BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)
                ),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue.withOpacity(0.7)
                  ),
                  child:Icon(Icons.image),
                  onPressed: (){
                    ServiceImagePicker().pickImage().then((value){
                      refOfProviderMessageMockup.addMessage(MessagesModel(
                          message: value, isHero: false, enumResponseType: EnumResponseType.UserResponseImage
                      ));
                    });
                  },
                )
            )
        ),
      ],
    );
  }

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



  /** Row buildAudioInputField(TextEditingController _messageTypeController, ProviderMessageMockup refOfProviderMessageMockup, BuildContext context) {

    bool microphoneOn=false;

    return Row(
      children: [
        Expanded(
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)
                ),
                child:TextField(
                  controller: _messageTypeController,
                  decoration: InputDecoration(
                      hintText: "Please Enter your problem",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                  ),
                )
            )
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onLongPressStart: (LongPressStartDetails longPressStartDetails){
              _serviceAudioRecording.recordStart();
          },
          onLongPressEnd: (LongPressEndDetails tapUpDetails){
            _serviceAudioRecording.stopRecord().then((value){
              //print(value.fileName);
              refOfProviderMessageMockup.addMessage(MessagesModel(
                  message: value.filePath ?? '', isHero: false, enumResponseType: EnumResponseType.UserResponseRecording
              ));
              _messageTypeController.clear();
              FocusScope.of(context).unfocus();
            });
          },
          child: CircleAvatar(
            radius: 25,
            child: Icon(Icons.mic,color: Colors.white),
          ),
        )
      ],
    );
  }
      **/

  //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

}
