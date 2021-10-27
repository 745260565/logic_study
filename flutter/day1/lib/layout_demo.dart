import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
      alignment: Alignment(0.0, 0.0),
      //spaceAround 多余的空间分配到小部件之间
      //spaceBetween 多余的空间分配到小部件周围
      //spaceEvenly 剩下的空间和小部件一起平均分
      //crossAxisAlignment 交叉轴，和主轴垂直
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(child:
            Container(
            color: Colors.yellow,
            child: Text(
              "保存",
              style: TextStyle(fontSize: 15),
            ),
          ),),
          Expanded(child:
            Container(
            color: Colors.green,
            child: Text(
              "要职",
              style: TextStyle(fontSize: 30),
            ),
          ),),
          Expanded(child:
            Container(
            color: Colors.white,
            child: Text(
              "顶置ksdlfjldsjflsdjflksdjfl",
              style: TextStyle(fontSize: 45),
            ),
          ),)
        ],
      ),
    );
  }

}

class LayoutDemo2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 300,
      width: 300,
      alignment: Alignment(0,0),
      child: Container(
        color: Colors.blue,
        height: 200,
        width: 200,
        child: AspectRatio(
          aspectRatio: 1/1,
          child: Container(
            height: 30,
            width: 30,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      alignment: const Alignment(0, 0),
      child: Stack(
        children: [
          Positioned(child: Container(
            color: Colors.redAccent,
            width: 300,
            height: 300,
            child: Icon(Icons.add),
          ),
          ),
          Positioned(child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: Icon(Icons.search),
            margin: EdgeInsets.only(left: 20),
          ),left: 10,),
          Positioned(child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: Icon(Icons.code),
          ),right: 10,),
        ],
      ),
    );
  }

}