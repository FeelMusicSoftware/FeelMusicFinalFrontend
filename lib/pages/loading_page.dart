import 'package:feel_music_final/Colors.dart';
import 'package:flutter/material.dart';
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color3,
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: size.width*0.3,
                backgroundImage:
                // backgroundImage: widget.songInfo.albumArtwork==null?
                AssetImage("assets/images/final.jpg"),
                // this.widget.index<6?AssetImage(_images[this.widget.index]):AssetImage(_images[1]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
