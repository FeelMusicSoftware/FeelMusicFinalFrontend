
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:feel_music_final/Colors.dart';
import 'package:feel_music_final/Components/MusicCard.dart';
import 'package:feel_music_final/Components/music_box_widget.dart';
import 'package:feel_music_final/Pages/player_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_audio_query/flutter_audio_query.dart';
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // final FlutterAudioQuery? audioQuery = FlutterAudioQuery();
  // AudioPlayer audioPlayer=AudioPlayer();
  bool isPlaying=false;
  List<File> listMusic=[];
  var _artist="None";
  @override
  void initState() {
    super.initState();
    getSongs();
  }
  void getSongs ()async{
    var status=await Permission.storage.request().isGranted;
    if (status ){
      // code of read or write file in external storage (SD card)
      // Directory directory = Directory('/storage/emulated/0/Download');
      Directory directory = Directory('/storage/emulated/0');
      // Directory? directory=await getExternalStorageDirectory();
      // print(directory);
      if(directory!=null){
        directory.listSync().forEach((element)
        {
          Directory folder=Directory(element.path);
          if(folder.existsSync()){
            folder.listSync().forEach((element) {
              var partes=element.path.split(".");
              if(partes.length>0 && partes.last=="mp3" || partes.last=="m4a"){
                setState(() {
                  listMusic.add(File(element.path));
                });
                // print(listMusic.last);
              }
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color4,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: ListView.builder(
              itemCount: listMusic.length,
              itemBuilder:(context,index){
                // print(listMusic.length);
                var _songName=listMusic[index].path.split("/");
                var _artistPart=_songName.last.split("-");
                if(_artistPart.first!=_artistPart.last){
                  _artist=_artistPart.first;
                }
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>PlayerPage(listMusic, index)));
                    },
                      child: (index%2==0)?MusicCard(size.width, size.height*0.11, color3, _artistPart.last, _artist):
                      MusicCard(size.width, size.height*0.11, color4, _artistPart.last, _artist)
                  );
              }
          ),
        ),
      ),
    );
  }
}
