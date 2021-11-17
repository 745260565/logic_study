
import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(),
          Expanded(flex: 1,child: ListView.builder(itemBuilder: ((BuildContext context, int index){
            return Text('123$index');
          }),itemCount: 3,),),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: WeChatThemeColor,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 44,
            color: Colors.red,
            child: Row(
              children: [
                Container(
                  width: screenWidth(context) - 60,
                  height: 34,
                  margin: EdgeInsets.only(left: 5,right: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      Image(image: AssetImage('images/放大镜b.png'),width: 20,color: Colors.grey,),
                      Expanded(child: TextField(
                        autocorrect: true,
                        cursorColor: Colors.green,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5,bottom: 10),
                          border: InputBorder.none,
                          hintText: '搜索'
                        ),
                      ),),
                      Icon(Icons.cancel,size: 20,color: Colors.grey,),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),//左边圆角背景
                
                Text('取消'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

