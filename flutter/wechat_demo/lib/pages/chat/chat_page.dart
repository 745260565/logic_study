import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/tools/http_manager.dart';

import 'search_cell.dart';


func(message) {
  print('开始');
  for(int i = 0;i<100000000000;i++) {}
  print('结束');
}

class Chat {
  final String? name;
  final String? message;
  final String? imageUrl;
  Chat({this.name,this.message,this.imageUrl});
  //工厂构造
  factory Chat.formMap(Map map){
    return Chat(
      name: map['name'],
      message: map['message'],
      imageUrl: map['imageUrl'],
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin{

  // late Timer _timer;

  bool _cancelConnect = false;

  //模型数组
  List<Chat> _datas = [];

  Widget _buildPopupMenuItem(String imgAss, String title) {
    return Row(
      children: [
        Image(
          image: AssetImage(imgAss),
          width: 20,
        ),
        SizedBox(width: 20,),
        Text(
          title,
          style: TextStyle(color: Colors.white ),
        ),
      ],
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   print('chatPage销毁了');
  //   if(_timer != null && _timer.isActive) {
  //     _timer.cancel();
  //   }
  //   super.dispose();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // int _count = 0;
    // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   _count++;
    //   print(_count);
    //   if(_count == 99) {
    //     timer.cancel();
    //   }
    // });


    // final a = getDatas();
    // a.then((value) => null);
    //获取网络数据
    getDatas().then((List<Chat> datas){
      if(!_cancelConnect) {
        setState(() {
          _datas = datas;
        });
      }
    }).catchError((e){
          print(e);
    }).whenComplete(() {
      print('完毕');
    }).timeout(Duration(seconds: 100)).catchError((timeout) {
      print('超时了');
      _cancelConnect = true;
    });
  }

  Future<List<Chat>> getDatas() async{
    setState(() {
      _cancelConnect = false;
    });
    // final url = Uri.parse("http://rap2api.taobao.org/app/mock/293340/api/chat/list");
    String url = "http://rap2api.taobao.org/app/mock/293340/api/chat/list";
    final response = await HttpManager.get(url);
    if(response.statusCode == 200) {
      // print(response.body);
      //获取响应数据，转成Map类型
      // final responsBody = json.decode(response.data);
      List<Chat> chatList = response.data['chat_list'].map<Chat>((item) => Chat.formMap(item)).toList();//后续重点理解
      print(chatList);
      return chatList;
    } else {
      throw Exception('statusCode: ${response.statusCode}');
    }

    //json转 Map
    // final chat = {
    //   'name':'A',
    //   'message':'B',
    // };
    // final chatJson = json.encode(chat);
    // print(chatJson);
    //
    // final newChat = json.decode(chatJson);
    // print(newChat);
    // print(newChat is Map);
    //
    // final chatModel = Chat.formMap(newChat);
    // print('name:${chatModel.name} message:${chatModel.message} ');
  }

  Widget itmeBuildForRow(BuildContext context,int index){
    if(index == 0) {
      return SearchCell(datas: _datas,);
    }
    index--;
    return ListTile(
                title: Text(_datas[index].name!),
                subtitle: Container(
                  child: Text(_datas[index].message!,overflow: TextOverflow.ellipsis,),
                ),
                leading: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: NetworkImage(_datas[index].imageUrl!),
                    ),
                  ),
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: const Text(""
            "微信页面"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              color: Color.fromRGBO(1, 1, 1, 0.5),
              offset: Offset(0,60.0),
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem(child: _buildPopupMenuItem('images/发起群聊.png', '发起群聊')),
                  PopupMenuItem(child: _buildPopupMenuItem('images/添加朋友.png', '添加朋友')),
                  PopupMenuItem(child: _buildPopupMenuItem('images/扫一扫1.png', '扫一扫')),
                  PopupMenuItem(child: _buildPopupMenuItem('images/收付款.png', '收付款')),
                ];
              },
              child: Image(
                image: AssetImage('images/圆加.png'),
                width: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Future((){
                return compute(func,3);
              });
            },
            child: Container(
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Container(
        child: Container(
          child: _datas.length == 0? Center(child: Text("Loading...."),):
          ListView.builder(
            itemCount: _datas.length+1,
              itemBuilder: itmeBuildForRow),
        ),
        // child: FutureBuilder(
        //   future: getDatas(),
        //   builder: (BuildContext context,AsyncSnapshot snapshot) {
        //     print("data:${snapshot.data}");
        //     print("data:${snapshot.connectionState}");
        //     if(snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: Text('Loading'),);
        //     }
        //     return ListView(
        //       children: snapshot.data.map<Widget>((Chat item){
        //         return ListTile(
        //           title: Text(item.name!,),
        //           subtitle: Container(
        //             alignment: Alignment.bottomCenter,
        //             padding: EdgeInsets.only(right: 10),
        //             height: 25,
        //             child: Text(item.message!,overflow: TextOverflow.ellipsis,),
        //           ),
        //           leading: Container(
        //             width: 44,
        //             height: 44,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(6.0),
        //               image: DecorationImage(
        //                   image: NetworkImage(item.imageUrl!)
        //               ),
        //             ),
        //           ),
        //           // CircleAvatar(
        //           //   backgroundImage: NetworkImage(item.imageUrl!),
        //           // ),
        //         );
        //       }).toList(),
        //     );
        //   },
        // ),
        // child: ListView.builder(itemBuilder: (BuildContext,int index) {
        //   return Text('hello');
        // },itemCount: 10,),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}
