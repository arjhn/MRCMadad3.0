import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayer1 extends StatefulWidget {

  final bool localFile;
  final String filePath;

  const AudioPlayer1({
    Key? key,
    required this.localFile,
    required this.filePath
  }) : super(key: key);

  @override
  _AudioPlayer1State createState() => _AudioPlayer1State();
}

class _AudioPlayer1State extends State<AudioPlayer1> {

  late AudioPlayer audioPlayer;
  late Duration duration;
  late Timer sliderTimer;
  Duration sliderDuration=Duration(seconds: 0);

  @override
  void initState(){
    super.initState();
    audioPlayer=AudioPlayer();
    audioPlayer.setUrl(widget.filePath);
    //widget.localFile?setLocalPath(widget.filePath):setWebPath(widget.filePath);
  }

  Future<void> setWebPath(String urlPath) async{
    duration = await audioPlayer.setUrl(urlPath) ?? Duration.zero;
  }

  Future<void> setLocalPath(String localPath) async{
    duration = await audioPlayer.setFilePath(localPath) ?? Duration.zero;
  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context,snapshot){
            final playerState=snapshot.data;
            return Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 5,),
                  playerMain(playerState),
                  SizedBox(width: 2,),
                  Slider(
                      value: sliderDuration.inSeconds.toDouble(),
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      divisions: duration.inSeconds.toInt(),
                      onChanged:(double newValue){

                      }
                  ),
                  Text("${twoDigits(sliderDuration.inMinutes.remainder(60))} : ${twoDigits(sliderDuration.inSeconds.remainder(60))}"),
                  SizedBox(width: 20,)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget playerMain(PlayerState? playerState){

    final processingState=playerState?.processingState;

    if(processingState == ProcessingState.loading || processingState == ProcessingState.buffering){

      //resetTimer();
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 64,
        height: 64,
        child: CircularProgressIndicator(),
      );
    }

    else if(audioPlayer.playing != true){
      return IconButton(
          onPressed: (){
            playTimer();
            audioPlayer.play();
          },
          icon: Icon(Icons.play_arrow)
      );
    }

    else if(processingState != ProcessingState.completed){
      return IconButton(
          onPressed: (){
            audioPlayer.pause();
          },
          icon: Icon(Icons.pause)
      );
    }

    else{
      sliderTimer.cancel();
      return IconButton(
          onPressed: () {
            resetTimer();
            audioPlayer.seek(
                Duration.zero,
            );
          },
          icon: Icon(Icons.replay)
      );
    }

  }

  String twoDigits(int n) => n.toString().padLeft(2,'0');

  void playTimer(){
    sliderTimer=Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        sliderDuration=Duration(seconds: sliderDuration.inSeconds+1);
      });
    });
  }

  void resetTimer(){
    //sliderTimer.cancel();
    setState(() {
      sliderDuration=Duration(seconds: 0);
    });
  }

}

