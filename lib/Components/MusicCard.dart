
import 'package:flutter/material.dart';

import '../Colors.dart';
class MusicCard extends StatelessWidget {
  double _width;
  double _height;
  Color _color;
  String _songName;
  String _artistName;


  MusicCard(
      this._width, this._height, this._color, this._songName, this._artistName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      color: _color,
      child: Column(
        children: [
          Text(_songName,style: TextStyle(color: color1, fontWeight: FontWeight.bold,fontSize: _width*0.06),),
          Text(_artistName,style: TextStyle(color: color1,fontSize: _width*0.04 ),),
        ],
      ),
    );
  }
}

