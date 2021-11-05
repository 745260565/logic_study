import 'package:flutter/material.dart';

import '../../const.dart';

class IndexBar extends StatefulWidget {

  final void Function(String str)? indexBarCallBack;
  IndexBar({this.indexBarCallBack});

  @override
  _IndexBarState createState() => _IndexBarState();
}

int getIndex(BuildContext context,Offset globalPosition) {
  //拿到当前小部件的盒子
  RenderBox box = context.findRenderObject() as RenderBox;
  // print(box.globalToLocal(details.globalPosition));
  // print("现在位置了${details.globalPosition}");
  double y = box.globalToLocal(globalPosition).dy;//拿到y值,当前位置距离我部件的原点的距离
  //算出字符高度
  var itemHeight = screenHeight(context)/2/INDEX_WORDS.length;
  //算出第几个item
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length-1);//clamp设置范围
  // print('现在选中了${INDEX_WORDS[index]}');
  return index;
}

class _IndexBarState extends State<IndexBar> {

  Color _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> words = [];
    //加载words
    for(int i = 0;i< INDEX_WORDS.length;i++) {
      words.add(
          Expanded(child: Text(INDEX_WORDS[i],style: TextStyle(fontSize: 10,color: _textColor),))
      );
    }

    return Positioned(
        right: 0.0,
        top: screenHeight(context)/8,
        height: screenHeight(context)/2,
        width: 120,
        child: Row(
          children: [
            Container(
              alignment: Alignment(0,_indicatorY),
              width: 100,
              child: _indicatorHidden ? null: Stack(
                alignment: Alignment(-0.2,0),
                children: [
                  Image(image: AssetImage('images/气泡.png'),width: 60,),
                  Text(
                    _indicatorText,
                    style: TextStyle(fontSize: 35,color: Colors.white),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                getIndex(context, details.globalPosition);
                int index = getIndex(context, details.globalPosition);
                widget.indexBarCallBack!(INDEX_WORDS[index]);
                setState(() {
                  _indicatorY = 2.2/INDEX_WORDS.length*index-1.1;
                  _indicatorText = INDEX_WORDS[index];
                  _indicatorHidden = false;
                });
              },
              onVerticalDragDown: (DragDownDetails details){
                int index = getIndex(context, details.globalPosition);
                widget.indexBarCallBack!(INDEX_WORDS[index]);
                setState(() {
                  _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
                  _textColor = Colors.white;
                  _indicatorY = 2.2/INDEX_WORDS.length*index-1.1;
                  _indicatorText = INDEX_WORDS[index];
                  _indicatorHidden = false;
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                setState(() {
                  _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
                  _textColor = Colors.black;
                  _indicatorHidden = true;
                });
              },
              child: Container(
                color: _bkColor,
                width: 20,
                child: Column(
                  children: words,
                ),
              ),
            )
          ],
        )
    );//悬浮的索引条;
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
