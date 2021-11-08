import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat_page.dart';
import 'package:wechat_demo/pages/discover/discover_page.dart';
import 'package:wechat_demo/pages/friends/friends_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  List<Widget> _pages = [ChatPage(),FriendsPage(),DiscoverPage(),MinePage()];
  final PageController _controller = PageController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageView(
          controller: _controller,
          children: _pages,
          onPageChanged: (int index) {
            _currentIndex = index;
            setState(() {

            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _controller.jumpToPage(index);
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
