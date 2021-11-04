import 'package:flutter/material.dart';

class MusicFile extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return Container();
  }
}
