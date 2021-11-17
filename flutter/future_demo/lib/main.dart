import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//ignore_for_file: avoid_print
void main() {
  // isoLoadDemo();
  // FutureDemo1();
  // Timer.run(() {
  //   print('异步任务');
  // });
  // print('来了');

  //发送网络请求
  //创建Dio
  final dio = Dio();
  //下载数据
  var downloadUrl = 'https://edu-files-1251502357.cos.ap-shanghai.myqcloud.com/CourseTeacher_2.8.1.13_DailyBuild.dmg';
  // dio.download(downloadUrl, '/Users/chenghao/Desktop/').then((value) => print(value)).whenComplete(() => print('结束了'));
  String savePath = ' /Users/chenghao/Desktop/腾讯课堂.dmg';
  // download1(dio, downloadUrl, savePath);
  download2(dio, downloadUrl, savePath);

}

void download1(Dio dio,String url,savePath) {
  dio.download(url, savePath).then((value) => print(value)).whenComplete(() => print('结束了'));
}

void download2(Dio dio,String url,savePath) {
  //手机端沙盒路径
  String iOSPath = Directory.systemTemp.path + '/腾讯课堂.dmg';
  print(iOSPath);
  dio.download(url, (header){
    return iOSPath;
  },onReceiveProgress: showDownloadProgress).then((value) => print(value)).whenComplete(() => print('结束了')).catchError((e) => print(e));
}

void showDownloadProgress(int count,int total) {
  if(total != -1) {
    print((count / total * 100).toStringAsFixed(0) + '%');
  }
}

void isoLoadDemo() {
  Future(() {
    print("1 来了");
    return compute(func,123);
  }).then((value) => print('1结束'));
  Future(() {
    print("2 来了");
    return compute(func,123);
  }).then((value) => print('2结束'));
  Future(() {
    print("3 来了");
    return compute(func,123);
  }).then((value) => print('3结束'));
  Future(() {
    print("4 来了");
    return compute(func,123);
  }).then((value) => print('4结束'));
  Future(() {
    print("5 来了");
    return compute(func,123);
  }).then((value) => print('5结束'));
  Future(() {
    print("6 来了");
    return compute(func,123);
  }).then((value) => print('6结束'));
}


func(int message) {}

Future downloadFunc(str) async {

}

void FutureDemo1() {
  Future x = Future((){
    print('异步任务1');
    scheduleMicrotask((){
      print('微任务1');
    });
  }).then((value) {
    print('微任务3');
  });
  x.whenComplete(() {
    print('完毕');
  });
  x.then((value) {
    print('微任务2');
  });
}