import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class ExperimentAudioInput extends StatefulWidget {
  const ExperimentAudioInput({Key? key}) : super(key: key);

  @override
  _ExperimentAudioInputState createState() => _ExperimentAudioInputState();
}

class _ExperimentAudioInputState extends State<ExperimentAudioInput> {

  TextEditingController _messageTypeController = TextEditingController();
  bool audioPressed=false;
  bool microPhoneVisible=false;
  late Size size;
  Duration trackTimer=Duration();
  Timer? _timer;
  Timer? _microPhoneTimer;
  bool textFieldEmpty=false;

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Input'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20,20,20,20),
        child: buildAudioInput(),
      ),
    );
  }

  Widget buildAudioInput() {
    return Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: buildTextField(),
            ),
            SizedBox(width: 10,),
            Align(
              alignment: Alignment.bottomRight,
              child: buildAnimatedIcon(),
            )
          ],
        );
  }

  Container buildTextField() {
    return Container(
                height: 50,
                width: (size.width-20)*0.8,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)
                ),
                child:TextField(
                  controller: _messageTypeController,
                  enabled: !audioPressed?true:false,
                  onChanged: (value){
                      setState(() {
                        textFieldEmpty=value.isNotEmpty;
                      });
                  },
                  decoration: InputDecoration(
                      hintText: !audioPressed?"Please Enter your problem":"",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                  ),
                )
            );
  }

  GestureDetector buildAnimatedIcon() {
    return GestureDetector(
            onLongPressStart: (LongPressStartDetails longPressStartDetails){
              HapticFeedback.heavyImpact();
                setState(() {
                  audioPressed=true;
                });
                _timer= Timer.periodic(Duration(seconds: 1), (_) {
                      setState(() {
                        trackTimer=Duration(seconds: trackTimer.inSeconds+1);
                      });
                    });
                _microPhoneTimer=Timer.periodic(Duration(milliseconds: 1000), (_) {
                    setState(() {
                      microPhoneVisible=!microPhoneVisible;
                    });
                });
            },
            onLongPressEnd: (LongPressEndDetails tapUpDetails){
              setState(() {
                audioPressed=false;
                trackTimer=Duration();
                microPhoneVisible=false;
              });
              _timer?.cancel();
              _microPhoneTimer?.cancel();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                  buildMicrophonePartner(),
                !textFieldEmpty?buildMicrophone():buildSend(),
              ],
            )
          );
  }

  Container buildSend() {
    return Container(
                  width: (size.width-20)*0.135,
                  height: (size.width-20)*0.135,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue
                  ),
                child: Icon(Icons.send,color: Colors.white,)
                );
  }

  AnimatedContainer buildMicrophonePartner() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: audioPressed?40:0,
      width: audioPressed?(size.width-20)*0.75:0,
      decoration: BoxDecoration(
          color: Colors.transparent
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          microPhoneVisible?
          AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              opacity: microPhoneVisible?1.0:0,
              child: Container(
                  width: 30,
                  height: 40,
                  child: Icon(Icons.mic,color: Colors.red,)
              )
          ): Container(
            height: 40,
            width: 30,
          ),
          SizedBox(width: 10,),
          Text(twoDigits(trackTimer.inMinutes.remainder(60)),style: TextStyle(
              fontSize: 15
          ),),
          SizedBox(width: 3,),
          Text(':',style: TextStyle(
              fontSize: 18
          ),),
          SizedBox(width: 3,),
          Text(twoDigits(trackTimer.inSeconds.remainder(60)),style: TextStyle(
              fontSize: 15
          ),),
          SizedBox(width: 15,),
          Text('<',style: TextStyle(
              fontSize: 25
          ),),
          SizedBox(width: 10,),
          Text('slide to cancel',style: TextStyle(
              fontSize: 15
          ),),
          SizedBox(width: 20,),
        ],
      ),
    );
  }

  AnimatedContainer buildMicrophone() {
    return AnimatedContainer(
                width: audioPressed?(size.width-20)*0.15:(size.width-20)*0.135,
                height: audioPressed?(size.width-20)*0.15:(size.width-20)*0.135,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue
                ),
                duration: Duration(milliseconds: 100),
                child: Icon(Icons.mic,color: Colors.white),
              );
  }

  String twoDigits(int n) => n.toString().padLeft(2,'0');

}
