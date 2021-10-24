import 'package:flutter/material.dart';
import 'model/car.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}

class Home extends StatelessWidget{
  //_内部是指文件内部
  Widget _itemForRow(BuildContext context,int index) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(10),

    );
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterDemo"),

      ),
      body: ListView.builder(itemBuilder: _itemForRow,
      itemCount: 10),
    );
  }
}

//有状态 stateful 无状态 stateless
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



