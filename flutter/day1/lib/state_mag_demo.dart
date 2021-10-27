import 'package:flutter/material.dart';

class StateManagerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SMDState();

}

class _SMDState extends State<StateManagerDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("FlutterDemo"),

        ),
        body: Center(
          child: Chip(label: Text("$count"),),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          count++;
          setState(() {

          });
          print("count = $count");
        },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}