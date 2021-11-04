
import 'package:flutter/material.dart';

import '../Colors.dart';
class MusicBoxWidget extends StatelessWidget {
  double _width;
  double _height;
  String _image;
  String _songName;
  String _artistName;

  MusicBoxWidget(
      this._width, this._height, this._image, this._songName, this._artistName);

  @override

  Widget build(BuildContext context) {
    return Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                height: _height*0.5,
                width: _width*0.7,
                margin: EdgeInsets.only(left: _width*0.01,top: _width*0.014,bottom: _width*0.014,right: _width*0.01),
                // padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image:DecorationImage(
                      image: AssetImage(_image),
                      fit: BoxFit.fill
                  ),
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                  // color: _color,
                ),
              ),
              Text(_songName,style: TextStyle(color: color1,fontWeight: FontWeight.bold,fontSize: _height*0.1),),
              // SizedBox(height: 2,),
              Text(_artistName,style: TextStyle(color: color1.withOpacity(0.5),fontSize: _height*0.07),),
            ],
          ),

          // child: Image(image: AssetImage(_image),),
        );
  }
}
