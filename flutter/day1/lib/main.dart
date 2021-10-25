import 'package:flutter/material.dart';
import 'model/car.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Home(),
    );
  }

}

class Home extends StatelessWidget{
  //_内部是指文件内部
  Widget _itemForRow(BuildContext context,int index) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.network(datas[index].imageUrl!),
          const SizedBox(
            height: 10,
          ),
          Text(
            datas[index].name!,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterDemo"),

      ),
      body: ListView.builder(
          itemBuilder: _itemForRow,
          itemCount: datas.length
      ),
    );
  }
}

//有状态 stateful 无状态 stateless
class MyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text(
        "hello fultter54uy",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}


final List<Car> datas = [
  const Car(
    name: '保时捷918 Spyder',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-7d8be6ebc4c7c95b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '兰博基尼Aventador',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-e3bfd824f30afaac?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '法拉利Enzo',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-a1d64cf5da2d9d99?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: 'Zenvo ST1',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-bf883b46690f93ce?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '迈凯伦F1',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-5a7b5550a19b8342?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '萨林S7',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-2e128d18144ad5b8?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '科尼赛克CCR',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-01ced8f6f95219ec?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '布加迪Chiron',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-7fc8359eb61adac0?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '轩尼诗Venom GT',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-d332bf510d61bbc2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  ),
  const Car(
    name: '西贝尔Tuatara',
    imageUrl:
    'https://upload-images.jianshu.io/upload_images/2990730-3dd9a70b25ae6bc9?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',
  )
];



