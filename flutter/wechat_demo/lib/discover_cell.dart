import 'package:flutter/material.dart';

class DiscoverCell extends StatelessWidget {

  final String title;
  final String imageName;
  final String subTitle;
  final String subImageName;


  DiscoverCell({this.title, this.imageName, this.subTitle, this.subImageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                //图标
                Image(image: AssetImage(imageName),width: 20,),
                SizedBox(width: 15,),
                //Title
                Text(title),
              ],
            ),
          ),
          //right
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                //subtitle
                subTitle != null ? Text(subTitle) : Text(""),
                //subImage
                subImageName != null ? Image.asset(subImageName) : Container(),
                //箭头
                Image(image: AssetImage("images/icon_right.png"),width: 15,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
