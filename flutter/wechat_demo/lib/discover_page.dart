import 'package:flutter/material.dart';
import 'package:wechat_demo/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Color _themColor = Color.fromRGBO(220, 220, 220, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themColor,
        elevation: 0.0,
        //Android设置
        title: const Text(""
            "发现页面"),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        color: _themColor,
        child: ListView(
          children: <Widget>[
            DiscoverCell(imageName: 'images/朋友圈.png', title: '朋友圈',),
            SizedBox(height: 10,),
            DiscoverCell(imageName: 'images/扫一扫2.png', title: '扫一扫',),
            Row(
              children: <Widget>[
                Container(width: 50,height: 0.5,color: Colors.white,),
                Container(height: 0.5,color: Colors.grey,),
              ],
            ),
            DiscoverCell(title: '摇一摇', imageName: 'images/摇一摇.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '看一看', imageName: 'images/看一看icon.png'),
            Row(
              children: <Widget>[
                Container(width: 50,height: 0.5,color: Colors.white,),
                Container(height: 0.5,color: Colors.grey,),
              ],
            ),
            DiscoverCell(imageName: 'images/搜一搜 2.png', title: '搜一搜',),
            SizedBox(height: 10,),
            DiscoverCell(imageName: 'images/附近的人icon.png', title: '附近的人',),
            SizedBox(height: 10,),
            DiscoverCell(title: '购物', imageName: 'images/购物.png',subTitle: '618限时特价',subImageName: 'images/badge.png',),
            Row(
              children: <Widget>[
                Container(width: 50,height: 0.5,color: Colors.white,),
                Container(height: 0.5,color: Colors.grey,),
              ],
            ),
            DiscoverCell(title: '游戏', imageName: 'images/游戏.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '小程序', imageName: 'images/小程序.png'),
          ],
        ),
      ),
    );
  }
}
