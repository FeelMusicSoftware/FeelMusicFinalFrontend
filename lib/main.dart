// import 'package:feel_music_final/Pages/BottomNavBar.dart';
import 'package:feel_music_final/pages/loading_page.dart';
import 'package:feel_music_final/pages/login_page.dart';
import 'package:feel_music_final/pages/BottomNavBar.dart';
import 'package:flutter/material.dart';

import 'Repositories/Token.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int log=0;
  @override
  void initState() {

    super.initState();
    logueado();
  }
  Future<void> logueado()async{
    var tok=await Token().getToken();
    if(tok!=null){
      setState(() {
        log=1;
      });
    }else{
      setState(() {
        log=2;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: log==0?LoginPage():log==1?BottomNavbar():LoadingPage(),
      routes: <String, WidgetBuilder> {
        '/screen1': (BuildContext context) => new LoginPage(),
        '/screen2' : (BuildContext context) => new BottomNavbar(),
        '/screen3' : (BuildContext context) => new LoadingPage(),
      },
    );
  }
}






