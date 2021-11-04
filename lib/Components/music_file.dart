import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicFile extends StatefulWidget {
 AudioPlayer audioPlayer;

 MusicFile(this.audioPlayer);

 @override
  _MusicFileState createState() => _MusicFileState();
}

class _MusicFileState extends State<MusicFile> {
  Duration _duration=new Duration();
  Duration _position=new Duration();
  String path="aca deberia ir la direccion de la cancion";
  bool isPlaying=false;
  bool isPaused=false;
  bool isLoop=false;
  List<IconData> _icons=[
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  @override
  void initState() {
    super.initState();
    this.widget.audioPlayer.onDurationChanged.listen((event) {setState(() {
      _duration=event;
    });});
    this.widget.audioPlayer.onAudioPositionChanged.listen((event) {setState(() {
      _position=event;
    });});

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
