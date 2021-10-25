

//有状态 stateful 无状态 stateless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text(
        "hello fultter54uy",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}