
import 'dart:io';

import 'package:feel_music_final/Colors.dart';
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
  List<File> listMusic=[];
  //
  @override
  void initState() {
    super.initState();
    getSongs();
  }
  // void getAlbums () async{
  //   /// getting all albums available on device storage
  //   List<AlbumInfo>? albumList = await audioQuery!.getAlbums();
  //
  //   /// getting all albums available from a specific artist
  //   // List<AlbumInfo> albums = await audioQuery.getAlbumsFromArtist(artist: artist.name);
  //   // albums.forEach( (artistAlbum) {
  //   //   print(artistAlbum); //print all album property values
  //   // });
  //   albumList.forEach( (artistAlbum) {
  //     print(artistAlbum); //print all album property values
  //   });
  // }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      body: Container(),
    );
  }
}
