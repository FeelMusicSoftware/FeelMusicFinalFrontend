import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:feel_music_final/Features/FaceRecognition/controller/home_controller.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();

}

class _ScanPageState extends State<ScanPage> {
  final _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFf2E4058),
      appBar: AppBar(
        title: Text('Estado de animo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.done),
      ),
      body: GetBuilder<HomeController>(
        init: _homeController,
        initState: (_) async {
          await _homeController.loadCamera();
          _homeController.startImageStream();
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
