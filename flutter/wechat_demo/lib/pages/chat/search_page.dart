
import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

import 'chat_page.dart';

class SearchPage extends StatefulWidget {
  final List<Chat>? datas;
  const SearchPage({this.datas});


  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchStr = '';
  List<Chat> _modals = [];

  void _searchData(String text) {
    _modals.clear();//每次搜索先清空
    _searchStr = text;
    if(text.length>0) {
      for(int i = 0;i<widget.datas!.length;i++) {
        //循环检索
        String name = widget.datas![i].name!;
        if(name.contains(text)) {
          _modals.add(widget.datas![i]);
        }
      }
    }
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(
            onChanged: (String text) {
              _searchData(text);
            },
          ),
          Expanded(
            flex: 1,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return itemWidget(index);
                },
                itemCount: _modals.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWidget(int index) {
    return ListTile(
      title: _title(_modals[index].name!),
      subtitle: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(right: 10),
        height: 25,
        child: Text(
          _modals[index].message!,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          image: DecorationImage(image: NetworkImage(_modals[index].imageUrl!)),
        ),
      ),
    );
  }

  TextStyle _normalStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  TextStyle _heighlightedStyle = TextStyle(
      fontSize: 16,
      color: Colors.green,
  );

  Widget _title(String name) {
    List<TextSpan> spans = [];
    List<String> strs = name.split(_searchStr);
    for(int i = 0; i<strs.length;i++) {
      String str = strs[i];
      if(str == '' && i<strs.length -1) {
        spans.add(TextSpan(text: _searchStr,style: _heighlightedStyle));
      } else {
        spans.add(TextSpan(text: str,style: _normalStyle));
        if(i<strs.length-1) {
          spans.add(TextSpan(text: _searchStr,style: _heighlightedStyle));
        }
      }
    }
    return RichText(text: TextSpan(children: spans));
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const SearchBar({this.onChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;
  void _onChanged(String text) {
    if(widget.onChanged != null) {
      widget.onChanged!(text);
    }
    setState(() {
      _showClear = (text.length > 0);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: WeChatThemeColor,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 44,
            child: Row(
              children: [
                Container(
                  width: screenWidth(context) - 60,
                  height: 34,
                  margin: const EdgeInsets.only(left: 5,right: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('images/放大镜b.png'),width: 20,color: Colors.grey,),
                      Expanded(child: TextField(
                        controller: _controller,
                        onChanged: _onChanged,
                        autocorrect: true,
                        cursorColor: Colors.green,
                        style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w300),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5,bottom: 10),
                          border: InputBorder.none,
                          hintText: '搜索'
                        ),
                      ),),
                      if(_showClear)
                        GestureDetector(
                          onTap: (){
                            _controller.clear();
                            setState(() {
                              _onChanged('');
                            });
                          },
                          child: const Icon(Icons.cancel,size: 20,color: Colors.grey,),
                        )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),//左边圆角背景
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Text('取消'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

