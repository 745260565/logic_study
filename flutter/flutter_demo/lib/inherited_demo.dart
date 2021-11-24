import 'package:flutter/material.dart';


class MyData extends InheritedWidget{
  final int data;//需要子组件中共享的数据
  //构造方法
  const MyData({required this.data,required Widget child}):super(child: child);

  //定义一个便捷方法，方便子组件中的Widget去获取共享的数据
  static MyData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyData>();
  }

  //该回调决定当前data发生变化时，是否通知子组件依赖data的widget
  @override
  bool updateShouldNotify(covariant MyData oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
    // throw UnimplementedError();
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
    return MyData(data: _count, child: Column(
      children: [
        Test1(count: _count,),
        ElevatedButton(onPressed: (){
          _count++;
          setState(() {

          });
        }, child: Text('按钮'))
      ],
    ));
  }
}

class Test1 extends StatelessWidget {
  final int? count;
  Test1({this.count});
  @override
  Widget build(BuildContext context) {
    return Test2(count: count,);
  }
}

class Test2 extends StatelessWidget {
  final int? count;
  Test2({this.count});
  @override
  Widget build(BuildContext context) {
    return Test3(count: count,);
  }
}

class Test3 extends StatefulWidget {
  final int? count;
  Test3({this.count});
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('didChangeDependencies');
    //此方法调用了表明了依依赖关系的数据有变动
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('Test3 build');
    return Text(MyData.of(context)!.data.toString());
  }
}


