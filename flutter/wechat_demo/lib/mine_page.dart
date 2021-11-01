import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  Widget headerWidget(){
    return Container(
      height: 200,
      color: Colors.red,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Stack(
          children: [
            //列表
            Container(
              child: ListView(
                children: [
                  headerWidget(),
                ],
              ),
            ),
            //相机
            Container(
              // color: Colors.red,
              margin: EdgeInsets.only(top: 40,right: 10),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(image: AssetImage('images/相机.png'),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
