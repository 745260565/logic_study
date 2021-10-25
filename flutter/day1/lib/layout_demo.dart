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