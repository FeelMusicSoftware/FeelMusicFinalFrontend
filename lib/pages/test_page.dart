
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:feel_music_final/Colors.dart';
import 'package:feel_music_final/Components/MusicCard.dart';
import 'package:feel_music_final/Components/music_box_widget.dart';
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
  AudioPlayer audioPlayer=AudioPlayer();
  List<File> listMusic=[];
  //
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
                listMusic.add(File(element.path));
                // print(listMusic.last);
              }
            });
          }
          // var partes=element.path.split(".");
          // if(partes.length>0 && partes.last=="mp3" || partes.last=="m4a"){
          //   listMusic.add(File (element.path));
          //   print(listMusic.last);
          // }
          // print(element.path);
        });

      }
    }

  }
  playLocal(String localPath) async {
    int result = await audioPlayer.play(localPath, isLocal: true);
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
                print(listMusic.length);
                var _songName=listMusic[index].path.split("/");
                  return MusicCard(size.width, size.height*0.11, color4, _songName.last, "prueba");
              }
          ),
        ),
      ),
    );
  }
}