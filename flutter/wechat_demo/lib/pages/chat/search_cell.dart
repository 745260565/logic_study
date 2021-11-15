import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

class SearchCell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 45,
        padding: EdgeInsets.all(5),
        color: WeChatThemeColor,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,borderRadius: BorderRadius.circular(6),
              ),
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage('image/放大镜b.png'),
                  width: 15,
                  color: Colors.grey,
                ),
                Text('搜索',style: TextStyle(fontSize: 15,color: Colors.grey),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
