import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/root_page.dart';
import 'package:dio/dio.dart';


void main() {
  runApp(const App());
  // runFuture();
  // testFuture4();
  // isoLofuncmo();

  // Future x = Future((){
  //   print('异步任务1');
  //   scheduleMicrotask((){
  //     print('微任务');
  //   });
  // });
  // x.then((value){
  //   print('微任务2');
  // });
}

void dioDemo() {
  //发送网络请求
  final dio = Dio();
  //
  var downloadUrl = '';
}

String _data = '0';

void isoLofuncmo() {
  Future(() =>compute(funcs,123)).then((value) => print('1结束'));
  Future(() =>compute(funcs,123)).then((value) => print('2结束'));
  Future(() =>compute(funcs,123)).then((value) => print('3结束'));
  Future(() =>compute(funcs,123)).then((value) => print('4结束'));
  Future(() =>compute(funcs,123)).then((value) => print('5结束'));
  Future(() =>compute(funcs,123)).then((value) => print('6结束'));

}

funcs(int message) {}

runFuture() {
  getData();
  print("做其它事件");
}

void computerTest() async{
  print('外部代码1');
  await compute(func2,10);
  sleep(Duration(seconds: 2));
  print('外部代码2');
}

void IsolateDemo() {
  print('1');
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  Isolate.spawn(func, 10);
  Isolate.spawn(func2, 10);
  print('2');
  print('3');

}

func(int count) {
  print('第一个来了');
}

func2(int count) {
  print('第二个来了$count');
}

void testFuture() async{
  // await Future(() {
  //   sleep(Duration(seconds: 1));
  //   print('C');
  // }).then((value) => print('D'));
  // print('B');
  Future(() {
    return '任务1';
  }).then((value) => print('$value结束'));
  Future(() {
    sleep(Duration(seconds: 1));
    return '任务2';
  }).then((value) => print('$value结束'));
  Future(() {
    return '任务3';
  }).then((value) => print('$value结束'));
  Future(() {
    return '任务4';
  }).then((value) => print('$value结束'));
  print('任务添加结束');

}

void testFuture1() async{
  // await Future(() {
  //   sleep(Duration(seconds: 1));
  //   print('C');
  // }).then((value) => print('D'));
  // print('B');
  Future(() {
    sleep(Duration(seconds: 1));
    return '任务1';
  }).then((value) {
    print('$value结束');
    return '$value任务2';
  }).then((value) {
    print('$value结束');
    return '$value任务3';
  }).then((value) {
    print('$value结束');
    return '$value任务4';
  }).then((value) {
    print('$value结束');
  });
  print('任务添加结束');

}

void testFuture2() async {
  Future.wait([
    Future((){
      return '任务A';
    }),
    Future((){
      sleep(Duration(seconds: 1));
      return '任务B';
    }),Future((){
      return '任务C';
    }),
  ]).then((value) => print(value[0]+value[1]+value[2]));
}

void testFuture3() async {
  print('外部代码1');
  Future(() => print('A')).then((value) => print('A结束'));
  Future(() => print('B')).then((value) => print('B结束'));
  scheduleMicrotask((){
    print('微任务A');
  });
  sleep(Duration(seconds: 2));
  print('外部代码2');
}

void testFuture4() async {
  Future future1 = Future((){});
  future1.then((value) {
    print('6');
    scheduleMicrotask(()=>print('7'));
  }).then((value) => print('8'));

  Future future = Future(()=>print('1'));
  future.then((value) => print('4'));

  Future((){
    print('2');
  });
  scheduleMicrotask(()=>print('3'));
  print('5');

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
  // future.then((value) => print('再多干点事件！'));
  future.then((value) => thenFunc(),onError: (e) => print(e.toString()));
  future.whenComplete(() => print('完成了')).catchError((e) => print("报错了"));

}

FutureOr thenFunc() {
  print('then');
}

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

