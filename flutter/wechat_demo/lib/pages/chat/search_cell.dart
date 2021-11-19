import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/pages/chat/search_page.dart';

import 'chat_page.dart';

class SearchCell extends StatelessWidget {
  final List<Chat>? datas;
  const SearchCell({this.datas});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SearchPage(datas: datas,)));
        print('点击了搜索框！');
      },
      child: Container(
        height: 44,
        padding: EdgeInsets.all(5),
        color: WeChatThemeColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(6),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                    image: AssetImage('images/放大镜b.png'),
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
