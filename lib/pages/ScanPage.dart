import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:feel_music_final/Features/FaceRecognition/controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../Colors.dart';

class ScanPage extends StatefulWidget {

  @override
  ScanPageState createState() => ScanPageState();

  ScanPage({required Key key}):super(key: key);
}

class ScanPageState extends State<ScanPage> {
  final _homeController = HomeController();
  var mood='';
  var face='';
  dis() {
    _homeController.detach();
    _homeController.dispose();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    dis();
    super.dispose();
  }
  _launchURL() async {
    const url = 'https://open.spotify.com/playlist/5bUXKGFhkxufnoAoVc1pAO';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLApp() async {
    var url = face == 'happy_face.png' ? 'https://open.spotify.com/playlist/5bUXKGFhkxufnoAoVc1pAO' : 'https://open.spotify.com/playlist/37i9dQZF1DXdZjf8WgcTKM';
    if (await canLaunch(url) && mood!='') {
      await launch(url);
    } else {
      await launch('https://play.google.com/store/apps/details?id=com.spotify.music&hl=es_BO&gl=US');
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFf2E4058),
      appBar: AppBar(
        // toolbarHeight: size.height * 0.08,
        backgroundColor: color3,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FeelMusic",
              style: TextStyle(fontSize: size.height * 0.036,color: color1),
            ),
            SizedBox(width: size.width*0.03,),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                  "assets/images/headphones.jpg",
                  width: size.width*0.13,
                  height: size.width*0.13,
                  fit:BoxFit.fill
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      floatingActionButton: SpeedDial(
          icon: Icons.done,
          backgroundColor: Colors.deepPurple,
          onOpen: () => {
            face = _homeController.faceAtMoment!
          },
          children: [
            SpeedDialChild(
              child: Icon(Icons.list),
              label: 'Listar',
              backgroundColor: Colors.deepPurpleAccent,
              onTap: _launchURL,
            ),
            SpeedDialChild(
              child: Icon(Icons.play_arrow),
              label: 'Reproducir',
              backgroundColor: Colors.deepPurpleAccent,
              onTap: _launchURLApp,
            ),
          ]),
      body: GetBuilder<HomeController>(
        init: _homeController,
        initState: (_) async {
          await _homeController.loadCamera();
          _homeController.startImageStream();
          mood = _homeController.faceAtMoment!;
        },
        builder: (_) {
          return Container(
            child: Column(
              children: [
                _.cameraController != null &&
                    _.cameraController!.value.isInitialized
                    ? Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: CameraPreview(_.cameraController!))
                    : Center(child: Text('cargando')),
                SizedBox(height: 15),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: 200,
                    height: 200,
                    color: const Color(0xFf2E4058),
                    child: Image.asset(
                      'assets/images/${_.faceAtMoment}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  '${_.label}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
