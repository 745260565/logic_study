

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget{

  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,

  );

  final String _lector = "AAAA";
  final String _title = "BBBBBB";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.yellow,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Icon(
                Icons.add,
              size: 45,
            ),
            padding: EdgeInsets.all(100),
            margin: EdgeInsets.all(20),
            height: 200,
          ),
        ],
      ),
    );
  }



}

class RichTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: const TextSpan(
        text: "sdklsjflsd",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "-----",
            style: TextStyle(
                fontSize: 18,
                color: Colors.red
            ),
          ),
          TextSpan(
            text: "sdfjlxcjlxc",
            style: TextStyle(
                fontSize: 18,
                color: Colors.green
            ),
          )
        ],

      ),
    );
  }

}