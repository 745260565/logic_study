import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas();
  }

  getDatas() async{
    final url = Uri.parse("http://rap2api.taobao.org/repository/get?id=85988");
    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""
            "微信页面"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              offset: Offset(0,60.0),
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem(child: Text('AAAA')),
                  PopupMenuItem(child: Text('AAAA')),
                  PopupMenuItem(child: Text('AAAA')),
                ];
              },
              child: Image(
                image: AssetImage('images/圆加.png'),
              ),
            ),
          ),

        ],
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (BuildContext,int index) {
          return Text('hello');
        }),
      ),
    );
  }
}
