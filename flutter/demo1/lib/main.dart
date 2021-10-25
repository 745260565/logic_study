import 'package:flutter/material.dart';

// void main() {
//   // num a = 1.5;
//   // print(a);
//   // a = 1;
//   // print(a);
//   // numDemo();
//   // listDemo();
//   // mapDemo();
//   // operatorDemo();
//   functionDemo();
// }

void main() => functionDemo();

/**
 * Dart中的方法
 * 方法也是一个对象
 * 返回值和参数类型可以省略
 * 当方法的执行语句只有一句的时候，可以使用箭头函数 => 表达式
 * 定义可选参数必须带上形参的名字和类型
 */
void functionDemo() {
  // print(sum(1, 20));
  // print(sum1(1,c: 9,b: 109));
  // print(sum2(1,3,9));

  var list = [1,2,3,4];
  list.forEach(printElement);

  var hello = printHello;
}

forEachDemo(List list, void func(var e)) {
  for(var e in list) func(e);
}

int b = 0;

printElement(var a) {
  b++;
  print("元素$b = $a");
}

printHello() => print("hello");

// int sum(int a, int b) {
//   return a + b;
// }
sum(a, b) => a==1? a + b : a - b;

// sum1(int a, {var b, var c}) {
//   b ??= 0;
//   c ??= 0;
//   return a + b + c;
// }

//?表示可以为空? 告诉编译器，我处理了后面为空的情况
// sum1(int a, {int? b, int? c}) {
//   b ??= 0;
//   c ??= 0;
//   return a + b + c;
// }

sum1(int a, {int b = 0, int c = 0}) {
  return a + b + c;
}

int sum2(int a,[int b = 0, int c = 0]) {
  return a + b + c;
}

void operatorDemo() {
  var a;
  a ??= 10;//如果a为空则赋值10，如果不为空则不赋值
  a ??= 5;
  print(a);

  var b;
  b = 5;
  print(b ?? a);//如果左边有值则返回左边，没有就返回右边
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
