import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wechat_demo/const.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas();
  }

  getDatas() async{
    final url = Uri.parse("http://rap2api.taobao.org/app/mock/293340/api/chat/list");
    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
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

        ],
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (BuildContext,int index) {
          return Text('hello');
        },itemCount: 10,),
      ),
    );
  }
}
