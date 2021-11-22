import 'package:flutter/material.dart';


class MyData extends InheritedWidget{
  final int data;//需要子组件中共享的数据
  //构造方法
  const MyData({required this.data,required Widget child}):super(child: child);
  //定义一个便捷方法，方便子组件中的Widget去获取共享的数据
  static MyData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(<MyData>());
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data
    throw UnimplementedError();
  }
}

class InheritedDemo extends StatefulWidget {
  const InheritedDemo({Key? key}) : super(key: key);

  @override
  _InheritedDemoState createState() => _InheritedDemoState();
}

class _InheritedDemoState extends State<InheritedDemo> {

  int _count = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Test1(),
        ElevatedButton(onPressed: (){
          _count++;
          setState(() {

          });
        }, child: Text('按钮'))
      ],
    );
  }
}

class Test1 extends StatelessWidget {
  final int? count;
  Test1({this.count});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

