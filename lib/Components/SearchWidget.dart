import 'package:flutter/material.dart';

import '../Colors.dart';
class SearchWidget extends StatelessWidget {
  double _width;
  double _height;
  // String _word;
  Color _color;

  // SearchWidget(this._width, this._height, this._word, this._color);
  SearchWidget(this._width, this._height, this._color);
  TextEditingController _search=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      // color: color5,
      height: _height,
      width: _width,
      margin: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
      padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
        color: _color,
      ),
      child: TextField(
        // cursorWidth: size.width*0.5,
        controller: _search,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          hintText: "Buscar",
          icon: Icon(Icons.search),
        ),
        style: TextStyle(color: color1),
        // cursorColor: color5,
      ),
    );
  }
}
