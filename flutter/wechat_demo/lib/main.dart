import 'package:flutter/material.dart';
import 'package:wechat_demo/root_page.dart';

// void main() {
//   runApp(const App());
// }

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        highlightColor: const Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: const Color.fromRGBO(1, 0, 0, 0.0),
      ),
      title: "WechatDemo",
      home: const RootPage(),
    );
  }
}

String _data = '0';

void main() {
  getData();
  print("做其它事件");
}

getData() async {

  print('开始data = $_data');
  //耗时操作
  // for(int i = 0;i<10000000000;i++) {
  //   _data = '网络数据';
  // }

  //后面操作必须是异步才能使用await修饰
  //当前这个函数也必须也是async修饰的函数
  //凭务丢进异步
   Future future = Future(() {
    for(int i = 0;i<5000000000;i++) {
      _data = '网络数据';
    }
    print('结束data = $_data');
  });
  print('结束data2 = $_data');
  future.then((value) => print('再多干点事件！'));
}