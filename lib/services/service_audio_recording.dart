import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:mrc_madad_3/models/model_audio_file_details.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io;
import 'dart:async';
import 'package:intl/intl.dart' show DateFormat;

/**class ServiceAudioRecording{

  ModelAudioDetails audioDetails=ModelAudioDetails();
  FlutterSoundRecorder _flutterSoundRecorder=FlutterSoundRecorder();
  bool? hasPermissions;
  String customPath='';
  String customFileName='';
  bool _isRecorderInitialized = false;

  Future<void> init() async{

    print('init called');

    final micStatus= await Permission.microphone.request();
    final storageStatus=await Permission.storage.request();

    if(micStatus.isGranted && storageStatus.isGranted)
      print('Kindly give permissions to access the microphone and storage to start the recording !');

    await _flutterSoundRecorder.openAudioSession(
      focus: AudioFocus.requestFocusAndStopOthers,
      category: SessionCategory.playAndRecord,
      mode: SessionMode.modeDefault,
      device: AudioDevice.speaker
    );
    await _flutterSoundRecorder.setSubscriptionDuration(Duration(milliseconds: 10));
    _isRecorderInitialized=true;
  }


  Future audioRecordStart(BuildContext context) async{

    io.Directory appDocDirectory;
    if (io.Platform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = (await getExternalStorageDirectory())!;
    }

    customFileName=DateTime.now().millisecondsSinceEpoch.toString();
    customPath = appDocDirectory.path + DateTime.now().millisecondsSinceEpoch.toString()+'.wav';

    //print('path '+customPath+" initialized:"+ _isRecorderInitialized.toString());

    _flutterSoundRecorder.openAudioSession();
    await _flutterSoundRecorder.startRecorder(
        toFile:customPath,
        codec: Codec.aacMP4
      );
  }

  Future<ModelAudioDetails> audioRecordStop() async{

    _flutterSoundRecorder.closeAudioSession();
    _flutterSoundRecorder.stopRecorder().then((value) =>
      FlutterSoundHelper().duration(customPath).then((value) =>
        audioDetails=ModelAudioDetails(
          duration: value,
          fileName: customFileName,
          filePath: customPath
        )
      )
    );
    return audioDetails;
  }

  Future<bool> permissionHandler() async{
    final micStatus= await Permission.microphone.request();
    final storageStatus=await Permission.storage.request();

    if(micStatus.isGranted && storageStatus.isGranted)
      return true;
    else
      return false;
  }

  void dispose(){
    _flutterSoundRecorder.closeAudioSession();
    _isRecorderInitialized=false;
  }
}
    **/

class ServiceAudioRecording{

  ModelAudioDetails audioDetails=ModelAudioDetails();
  FlutterSoundRecorder _myRecorder=FlutterSoundRecorder();
  String filePath='';
  bool _play = false;
  String _recorderTxt = '00:00:00';
  String fileName='';
  AssetsAudioPlayer _assetsAudioPlayer=AssetsAudioPlayer();
  FlutterSoundPlayer _flutterSoundPlayer=FlutterSoundPlayer();

  void init() async{
    await _myRecorder.openAudioSession(
        focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker
    );
    await _myRecorder.setSubscriptionDuration(Duration(milliseconds: 10));
    await _flutterSoundPlayer.openAudioSession(
      focus: AudioFocus.requestFocusAndStopOthers,
      category: SessionCategory.playback,
      device: AudioDevice.speaker,
      mode: SessionMode.modeDefault
    );
    await Permission.microphone.request();
    await Permission.storage.request();
  }

  Future<void> recordStart() async {

    io.Directory appDocDirectory;
    if (io.Platform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = (await getExternalStorageDirectory())!;
    }

    fileName=DateTime.now().millisecondsSinceEpoch.toString()+'.wav';
    filePath = appDocDirectory.path + fileName;

    _myRecorder.openAudioSession();
    await _myRecorder.startRecorder(
      toFile: filePath,
      codec: Codec.pcm16WAV,
    );
  }

  Future<ModelAudioDetails> stopRecord() async {
    _myRecorder.closeAudioSession();
    await _myRecorder.stopRecorder();
    Duration? dur= await FlutterSoundHelper().duration(filePath);
    audioDetails = ModelAudioDetails(
        duration: dur,
        fileName: fileName,
        filePath: filePath
    );
    print('Recording Stopped ! '+audioDetails.filePath.toString());
    return audioDetails;
  }

  Future<void> startPlaying(String filepath) async{
    _flutterSoundPlayer.startPlayer(
      fromURI: filepath
    );
    /**_assetsAudioPlayer.open(
      Audio.file(filepath),
      showNotification: true,
    );**/
  }

  Future<void> stopPlaying() async{
    await _flutterSoundPlayer.stopPlayer();
    //_assetsAudioPlayer.stop();
  }


}