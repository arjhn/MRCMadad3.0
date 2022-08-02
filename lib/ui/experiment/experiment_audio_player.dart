import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperimentAudioPlayer extends StatefulWidget {
  const ExperimentAudioPlayer({Key? key}) : super(key: key);

  @override
  _ExperimentAudioPlayerState createState() => _ExperimentAudioPlayerState();
}

class _ExperimentAudioPlayerState extends State<ExperimentAudioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
    );
  }
}
