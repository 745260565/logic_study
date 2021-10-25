import 'package:day1/base_widget.dart';
import 'package:day1/layout_demo.dart';
import 'package:day1/listview_demo.dart';
import 'package:flutter/material.dart';
import 'model/car.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text("FlutterDemo"),

        ),
        body: LayoutDemo(),
      ),
    );
  }
}








