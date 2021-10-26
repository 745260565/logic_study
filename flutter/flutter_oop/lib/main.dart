import 'package:flutter/material.dart';
import 'package:flutter_oop/factory_class.dart';
import 'package:flutter_oop/pesron.dart';

import 'lg_person.dart';


/**
 * 类和对象
 * 使用class关键字声明一个类
 * 可以使用new构造函数
 * 所有对象继承Object类
 */
void main() => personDemo();

void personDemo() {
  Person p = Person("aaa", 1, 100);
}

void factoryDemo() {
  FactoryClass fact1 = FactoryClass();
  FactoryClass fact2 = FactoryClass();
  print(fact2 == fact1);

}




