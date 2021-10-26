import 'package:day1/listview_demo.dart';
import 'package:flutter/material.dart';

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
        body: ListViewDemo(),
      ),
    );
  }
}








