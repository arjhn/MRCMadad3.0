import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mrc_madad_3/ui/audio_mixins/audio_player_backend.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class AudioPlayerMain extends StatefulWidget {

  final bool localFile;
  final String filePath;

  const AudioPlayerMain({
    Key? key,
    required this.localFile,
    required this.filePath
  }) : super(key: key);

  @override
  _AudioPlayerMainState createState() => _AudioPlayerMainState();
}

class _AudioPlayerMainState extends State<AudioPlayerMain> {

  late final AudioPlayerBackend _audioPlayerBackend;
  late Size size;

  @override
  void initState(){
    super.initState();
    _audioPlayerBackend=AudioPlayerBackend(widget.filePath,widget.localFile);
  }

  @override
  void dispose(){
    _audioPlayerBackend.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;

    /**return Scaffold(
      body: Center(
        child: audioPlayerBody(),
      ),
    );**/
    return audioPlayerBody();
  }

  Widget audioPlayerBody(){
    return Container(
          height: 60,
          width: size.width*0.7,
          decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)
          ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder<ButtonState>(
              valueListenable: _audioPlayerBackend.buttonNotifier,
              builder: (_, value, __) {
                switch (value) {
                  case ButtonState.loading:
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 32.0,
                      height: 32.0,
                      child: const CircularProgressIndicator(),
                    );
                  case ButtonState.paused:
                    return IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 40.0,
                      onPressed: _audioPlayerBackend.play,
                    );
                  case ButtonState.playing:
                    return IconButton(
                      icon: const Icon(Icons.pause),
                      iconSize: 40.0,
                      onPressed: _audioPlayerBackend.pause,
                    );
                }
              },
            ),
            SizedBox(width: size.width*0.03,),
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _audioPlayerBackend.progressNotifier,
              builder: (_, value, __) {
                return Container(
                  width: size.width*0.45,
                  child: ProgressBar(
                    progress: value.current,
                    buffered: value.buffered,
                    total: value.total,
                    onSeek: _audioPlayerBackend.seek,
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }

}
