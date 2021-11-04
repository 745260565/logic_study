import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

import 'discover/discover_cell.dart';

class MinePage extends StatefulWidget {

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  Widget headerWidget(){
    return Container(
      height: 200,
      color: Colors.white,
      child: Container(
        child: Container(
          margin: EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 10),
          child: Row(
            children: [
              //头像
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('images/Hank.png'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              //右边部分
              Expanded(child: Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 35,
                      child: Text(
                        'Cheng',
                        style: TextStyle(fontSize: 25,color: Colors.black),
                      ),
                    ),//昵称
                    Container(
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "微信号：sdkjlx",
                            style: TextStyle(fontSize: 17,color: Colors.grey),
                          ),
                          Image(
                            image: AssetImage('images/icon_right.png'),
                            width: 15,
                          ),
                        ],
                      ),
                    ),//微信号加箭头
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: WeChatThemeColor,
        child: Stack(
          children: [
            //列表
            Container(
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      //头部
                      headerWidget(),
                      //list
                      SizedBox(height: 10,),
                      DiscoverCell(
                        imageName: 'images/微信 支付.png',
                        title: '支付',
                      ),
                      SizedBox(height: 10,),
                      DiscoverCell(
                        imageName: 'images/微信收藏.png',
                        title: '收藏',
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 50, height: 0.5, color: Colors.white),
                          Container(height: 0.5, color: Colors.grey)
                        ],
                      ),
                      DiscoverCell(
                        imageName: 'images/微信相册.png',
                        title: '相册',
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 50, height: 0.5, color: Colors.white),
                          Container(height: 0.5, color: Colors.grey)
                        ],
                      ), //分割线
                      DiscoverCell(
                        imageName: 'images/微信卡包.png',
                        title: '卡包',
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              width: 50, height: 0.5, color: Colors.white),
                          Container(height: 0.5, color: Colors.grey)
                        ],
                      ), //分割线
                      DiscoverCell(
                        imageName: 'images/微信表情.png',
                        title: '表情',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(
                        imageName: 'images/微信设置.png',
                        title: '设置',
                      ),
                    ],
                  ))
            ),
            //相机
            Container(
              // color: Colors.red,
              margin: EdgeInsets.only(top: 40,right: 10),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(image: AssetImage('images/相机.png'),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
