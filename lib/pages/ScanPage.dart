import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:feel_music_final/Features/FaceRecognition/controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();

}

class _ScanPageState extends State<ScanPage> {
  final _homeController = HomeController();
  var mood='';
  _launchURL() async {
    const url = 'https://open.spotify.com/playlist/5bUXKGFhkxufnoAoVc1pAO';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLApp() async {
    var url = _homeController.faceAtMoment == 'happy_face.png' ? 'https://open.spotify.com/playlist/5bUXKGFhkxufnoAoVc1pAO' : 'https://open.spotify.com/playlist/37i9dQZF1DXdZjf8WgcTKM';
    if (await canLaunch(url) && mood!='') {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFf2E4058),
      appBar: AppBar(
        title: Text('Estado de animo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURLApp,
        child: Icon(Icons.done),
      ),
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
                      'images/${_.faceAtMoment}',
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