import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Colors.dart';
class PlayerPage extends StatefulWidget {
  List<File> listMusic;
  int index;

  PlayerPage(this.listMusic,this.index); // PlayerPage({required this.listMusic,}):super(key: key);
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  Duration _duration=new Duration();
  Duration _position=new Duration();
  AudioPlayer audioPlayer=AudioPlayer();
  String currentTime='0:00', endTime='0:00';
  double minimunValue=0.0,maximunValue=0.0, currentValue=0.0;
  bool isPlaying=false;String _artist="None";
  var _songName;var _artistPart;

  @override
  void initState() {
    super.initState();
    this.audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration=event;
      });
    });
    this.audioPlayer.onAudioPositionChanged.listen((event) {setState(() {
      _position=event;
    });});
    // this.audioPlayer.setUrl(url);
    setSong();

  }

  playLocal(String localPath) async {
    int result = await audioPlayer.play(localPath, isLocal: true);
  }

  pauseLocal() async {
    int result = await audioPlayer.pause();
  }

  void setSong(){
    setState(() {
      _songName=widget.listMusic[widget.index].path.split("/");
      _artistPart=_songName.last.split("-");
      if(_artistPart.first!=_artistPart.last){
        _artist=_artistPart.first;
      }
    });
  }

  String getDuration(double value){
    Duration duration=Duration(milliseconds: value.round());
    return [duration.inMinutes,duration.inSeconds].map((e) => e.remainder(60).toString().padLeft(2,'0')).join(':');
  }
  void changeToSecond(int second){
    Duration newDuration=Duration(seconds: second);
    this.audioPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async {
        setState(() {
          pauseLocal();
          isPlaying=false;
        });
        return true;
      },
      child: Scaffold(
        backgroundColor: color4,
        body: Container(
          margin: EdgeInsets.fromLTRB(5, 40, 5, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: size.width*0.3,
                backgroundImage:
                // backgroundImage: widget.songInfo.albumArtwork==null?
                AssetImage("assets/images/img1.jpg"),
              ),
                // FileImage(File(widget.songInfo.albumArtwork)),),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(_artistPart.last,style: TextStyle(color: color1,fontSize: size.width*0.07,fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Text(_artist,style: TextStyle(color: color10,fontSize: size.width*0.04,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: size.width*0.15,),
              Slider(
                  inactiveColor: Colors.white12,
                  activeColor: Colors.white,
                  min: minimunValue,
                  max: _duration.inSeconds.toDouble(),
                  value: _position.inSeconds.toDouble(),
                  onChanged:(double value){
                    setState(() {
                      changeToSecond(value.toInt());
                      value=value;
                    });
                  }
              ),
              Container(
                transform: Matrix4.translationValues(0, -5, 0),
                margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_position.toString().split(".")[0],style: TextStyle(color: color10,fontSize: size.width*0.04,fontWeight: FontWeight.bold),),
                    Text(_duration.toString().split(".")[0],style: TextStyle(color: color10,fontSize: size.width*0.04,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.skip_previous,color: color1,size: size.width*0.18,),behavior: HitTestBehavior.translucent,
                      onTap: (){
                        setState(() {
                          // print(this.widget.index);
                          if(this.widget.index==0){
                            this.widget.index=this.widget.listMusic.length-1;
                          }else{
                            this.widget.index--;
                          }
                          pauseLocal();
                          isPlaying=false;
                          setSong();
                          playLocal(widget.listMusic[widget.index].path);
                          isPlaying=true;
                          // print("actualiza");
                          // print(this.widget.index);
                        });
                        // widget.changeTrack(true);
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.history,color: color1,size: size.width*0.1,),behavior: HitTestBehavior.translucent,
                      onTap: (){
                        this.audioPlayer.setPlaybackRate(0.5);
                        // widget.changeTrack(false);
                      },
                    ),
                    GestureDetector(
                      child: Icon(isPlaying?Icons.pause_circle_filled:Icons.play_circle_fill,color: color1,size: size.width*0.2,),behavior: HitTestBehavior.translucent,
                      onTap: (){
                        if(isPlaying){
                          // print("es verdad");
                          pauseLocal();
                          setState(() {
                            isPlaying=false;
                          });
                        }else{
                          // print("es falso");
                          playLocal(widget.listMusic[widget.index].path);
                          this.audioPlayer.setPlaybackRate(1);
                          setState(() {
                            isPlaying=true;
                          });
                        }
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.forward_5,color: color1,size: size.width*0.1,),behavior: HitTestBehavior.translucent,
                      onTap: (){
                        this.audioPlayer.setPlaybackRate(1.5);
                        // widget.changeTrack(false);
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.skip_next,color: color1,size: size.width*0.18,),behavior: HitTestBehavior.translucent,
                      onTap: (){
                        setState(() {
                          // print(this.widget.index);
                          if(this.widget.index==this.widget.listMusic.length-1){
                            this.widget.index=0;
                          }else{
                            this.widget.index++;
                          }
                          pauseLocal();
                          isPlaying=false;
                          setSong();
                          playLocal(widget.listMusic[widget.index].path);
                          isPlaying=true;
                        });
                        // widget.changeTrack(true);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
