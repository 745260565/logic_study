import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
import 'package:wechat_demo/pages/friends/friends_data.dart';
import 'package:wechat_demo/pages/friends/index_bar.dart';

class _FriendCell extends StatelessWidget {

  final String? imageUrl;//？表示可以传空
  final String? name;
  final String? groupTitle;
  final String? imageAssets;

  _FriendCell({this.imageUrl,this.name,this.groupTitle,this.imageAssets});//本文件可以访问

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          height: groupTitle != null ? 30:0,
          color: WeChatThemeColor,
          child: groupTitle != null ? Text(groupTitle!,style: TextStyle(color: Colors.grey),) : null,
        ),//头部
        Container(
          color: Colors.white,
          child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  image: imageUrl != null
                      ? NetworkImage(imageUrl!) as ImageProvider
                      : AssetImage(imageAssets!),
                ),
              ),
            ),//图片
            Container(
              width: screenWidth(context)-54,
              child: Column(
                children: [
                  Container(
                    height: 54,
                    alignment: Alignment.centerLeft,
                    child: Text(name!,style: TextStyle(fontSize: 18),),
                  ),
                  Container(height: 0.5,color: WeChatThemeColor,alignment: Alignment.bottomCenter,),
                ],
              ),
            ),//昵称+下划线
          ],
        ),
        ),//cell内容
      ],
    );
  }
}


class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final double _cellHeight = 54.5;
  final double _groupHeight = 30.0;
  //字典，里面放item和高度对应的数据
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]:0.0,
    INDEX_WORDS[1]:0.0,//前两个🔍和🌟值为0.0
  };

  final List<Friends> _headerData = [
    Friends(imageAssets: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageAssets: 'images/群聊.png', name: '群聊'),
    Friends(imageAssets: 'images/标签.png', name: '标签'),
    Friends(imageAssets: 'images/公众号.png', name: '公众号'),
  ];

  final List<Friends> _listDatas = [];

  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    // TODO: implement initState
    super.initState();
    //创建数据
    _listDatas
      ..addAll(datas)
      ..addAll(datas);
    //排序
    _listDatas.sort((Friends a,Friends b){
      return a.indexLetter!.compareTo(b.indexLetter!);
    });
    var _groupOffset = _cellHeight*_headerData.length;
    //经过循环计算，将每一个头的位置算出来，放入字典
    for(int i = 0;i<_listDatas.length;i++) {
      if(i<1) {//第一个cell一定有头
        _groupOffsetMap.addAll({_listDatas[i].indexLetter:_groupOffset});//Map里加入 "A":高度
        //保存完了再加_groupHeight
        _groupOffset += _cellHeight+_groupHeight;
      } else if(_listDatas[i].indexLetter == _listDatas[i-1].indexLetter) {
        //不用存，只需加Cell高度
        _groupOffset += _cellHeight;
      } else {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter:_groupOffset});
        _groupOffset += _cellHeight+_groupHeight;
      }
    }

  }

  Widget _itemForRow(BuildContext context, int index) {
    if(index < _headerData.length) {
      return _FriendCell(imageAssets: _headerData[index].imageAssets,name: _headerData[index].name,);
    }else {//剩下的cell，不显示组名，显示组名
      //不显示
      bool _hiddenIndexLetter = index>4 && _listDatas[index-4].indexLetter == _listDatas[index-5].indexLetter;
      return _FriendCell(imageUrl: _listDatas[index-4].imageUrl,name: _listDatas[index-4].name,groupTitle: _hiddenIndexLetter ? null : _listDatas[index-4].indexLetter,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: const Text(""
            "通信录"),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(title: "添加朋友",)));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage('images/icon_friends_add.png'),
                width: 25,
              ),
            ),
          ),

        ],
      ),
      body: Stack(
        children: [
          Container(
            color: WeChatThemeColor,
            child: ListView.builder(itemBuilder: _itemForRow,controller: _scrollController,itemCount: _listDatas.length+_headerData.length,),
          ),//列表
          IndexBar(indexBarCallBack: (String str){
            print('选中${str}');
            if(_groupOffsetMap[str] != null) {
              _scrollController!.animateTo(_groupOffsetMap[str], duration: Duration(microseconds: 100), curve: Curves.easeIn);
            }
          },),
        ],
      ),
    );
  }
}
