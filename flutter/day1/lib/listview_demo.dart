

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' as H;

import 'model/car.dart';

class ListViewDemo extends StatelessWidget {
  //_内部是指文件内部
  Widget _itemForRow(BuildContext context,int index) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.network(datas[index].imageUrl!),
          const SizedBox(
            height: 10,
          ),
          Text(
            datas[index].name!,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          itemBuilder: _itemForRow,
          itemCount: datas.length
      ),
    );
  }
}