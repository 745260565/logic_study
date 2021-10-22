import 'package:flutter/material.dart';

void main() {
  // num a = 1.5;
  // print(a);
  // a = 1;
  // print(a);
  // numDemo();
  // listDemo();
  mapDemo();
}

/**
 * Dart中的Map键值对
 */
void mapDemo() {
  var json1 = {"one":"hank","tow":"sdkjl"};
  // var json1 = const{"one":"hank","tow":"sdkjl"};//不可变
  print(json1);
  print(json1["one"]);
  json1["one"] = "sdkjl";
  print(json1);
  print(json1.length);
  print(json1.values);
  print(json1.keys);
  var list = ["aaa","bbb","ccc"];
  print(list.asMap());

}

/**
 * 列表 可以存放不同的数据
 * 创建可变list var list1 = [1,2,3];
 * 创建不可变list var list 2 = const[1,2,3];
 */
void listDemo() {
  var list1 = [1,2,"cheng","hao"];
  // print(list1);
  // print(list1[3]);
  // list1[1] = "mn";
  // print(list1);
  var list3 = ["abd","dfls"];
  print(list3.length);
  list3.add("sdjkklxc");
  print(list3);
  list3.insert(1, "cat");
  print(list3);
  list3.clear();
  print(list3);
  var list4 = [1,3,2,5,9,2,10,4,2];
  list4.sort();
  print(list4);
  print(list4.sublist(4,7));//前包后不包
}

void numDemo() {
  num a = 10;
  print(a);
  a = 1.5;
  print(a);
  int b = 8;
  print(b.isEven);
  print(b.isOdd);
  print(a ~/ b);
  print(a.toInt().isEven);
}

void StringDemo() {
  var a = 'aa';
  var b = "bb";
  print(a + b);
  String str = '''a
  b
  c
  d''';
  // print(str);
  // print(a[0]);
  // print(str[4]);
  // print(a*5);
  // int c = 10;
  // int d = 20;
  // int f = c + d;
  // print("c + d = ${c+d}");
  // print("c + d = $f");

  String str3 = "cheng\nhao";
  String str4 = r"cheng\nhao";
  print(str3);
  print(str4);
  print(str4.length);
}
