import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:feel_music_final/Pages/FavoritesPage.dart';
import 'package:feel_music_final/Pages/PrincipalPage.dart';
import 'package:feel_music_final/Pages/ScanPage.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 1;
  final tabs=[
    ScanPage(),
    PrincipalPage(),
    FavoritesPage()
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        items: [
          Icon(Icons.search,size: 30,color: color2,),
          Icon(Icons.music_note,size: 30,color: color2,),
          Icon(Icons.person,size: 30,color: color2,),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
          // if(index==0){
          // }else if(index==1){
          //
          // }else if(index==2){
          //
          // }else{}
        },
        buttonBackgroundColor: color3,
        backgroundColor: color4,
        color: color3,
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 250),
        height: size.height*0.08,
      ),
    );
  }
}
