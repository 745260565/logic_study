import 'package:flutter/material.dart';
import 'package:wechat_demo/chat_page.dart';
import 'package:wechat_demo/discover_page.dart';
import 'package:wechat_demo/friends_page';
import 'package:wechat_demo/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 3;

  List<Widget> _pages = [ChatPage(),FriendsPage(),DiscoverPage(),MinePage()];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: _currentIndex,
          selectedFontSize: 12.0,
          items: const [
            BottomNavigationBarItem(
                icon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage("images/tabbar_chat.png"),
                ),
                activeIcon: Image(
                  height: 20,
                  width: 20,
                  image: AssetImage("images/tabbar_chat_hl.png"),
                ),
                label: "微信"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "通信录"),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: "发现"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "我的"),
          ],
        ),
      ),
    );
  }
}
