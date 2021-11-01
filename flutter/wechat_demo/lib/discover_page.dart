import 'package:flutter/material.dart';
import 'package:wechat_demo/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Color _themColor = Color.fromRGBO(220, 220, 220, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themColor,
        elevation: 0.0,
        //Android设置
        title: const Text(""
            "发现页面"),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        color: _themColor,
        child: ListView(
          children: [
          ],
        ),
      ),
    );
  }
}
