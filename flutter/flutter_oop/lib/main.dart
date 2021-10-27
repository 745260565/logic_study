import 'package:flutter/material.dart';
import 'package:flutter_oop/factory_class.dart';
import 'package:flutter_oop/pesron.dart';
import 'package:flutter_oop/static_class.dart';

import 'lg_person.dart';


/**
 * 类和对象
 * 使用class关键字声明一个类
 * 可以使用new构造函数
 * 所有对象继承Object类
 */
void main() => operatorDemo();


operatorDemo() {
  OperatorClass op1 = OperatorClass(30);
  OperatorClass op2 = OperatorClass(20);
  print(op1 > op2);

}

class OperatorClass {
  int age;
  OperatorClass(this.age);
  bool operator >( OperatorClass other ) => this.age > other.age;
}


/**
 * 混入，多断承
 * 作为混入类，不能使现构造方法,不能继承
 */
mixinDemo() {
  D d = D();
  d.a();
  // d.b();
  // d.c();
}

class A1{
  A1();
  a() => print("a...");
}

class B{
  a() => print("b...");
}

class C{
  a() => print("c...");
}

// class D extends A1 with B ,C {}

class D = A1 with B,C;//混入的另一种写法



/**
 * 抽象类，不能被实便化的类，使用abstract修饰
 */
abstractDemo() {
  SubClass as = SubClass();
  as.sum(10, 8);
  as.sum1(8, 0);
  as.sum2(15, 9);
}

abstract class AbstractClass {
  //抽象方法
  int sum(int a,int b);
}

abstract class AbstractClass1 {
  //抽象方法
  int sum1(int a,int b);
}

abstract class AbstractClass2 {
  //抽象方法
  int sum2(int a,int b);
}

class A{
  String? name;
  run(){
    print("AAA");
  }
}



class SubClass implements AbstractClass,AbstractClass1,AbstractClass2,A {
  @override
  int sum(int a, int b) {
    print("subClass..sum");
    return 0;
  }

  @override
  int sum1(int a, int b) {
    print("subClass..sum1");
    return 0;
  }

  @override
  int sum2(int a, int b) {
    print("subClass..sum2");
    return 0;
  }

  @override
  String? name;

  @override
  run() {
    // TODO: implement run
    throw UnimplementedError();
  }

}


/**
 * Dart中的继承
 * 使用extents继承一个类
 * 子类会继承除了构造方法以外的属性和方法
 * Dart是单继承的
 */

void extentsDemo() {
  Person st = Student();
  st.age = 19;
  st.name = "AAA";
  // st.height = 90;
  st.run();
  if(st is Student) {
    st.study();
  }
  print(st.isFree);
  print(st);
}

class Student extends Person {

  final String subName;

  Student.withName(String? name, this.subName) : super.withName(name);

  // Student(int? age) : super(age);
  Student():subName = "AAA", super.init();

  study() {
    print("sdlkkfjls");
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Student extents Person";
  }

  @override
  run() {
    // TODO: implement run
    print("Studnet run ....");
  }

  @override
  bool get isFree => age! < 18 ;

}

void staticDemo() {
  // StaticClass st = StaticClass();
  // st.currentCount = 15;
  // StaticClass.count = 10;
  // StaticClass.count = 20;
  // print(StaticClass.sum(30));
  // print(st.sum2(10));
  Object? s1 = Object();
  s1 = StaticClass();
  if(s1 is StaticClass) {
    print(s1.sum2(20));
    print(s1..currentCount = 15..sum2(20));
  }
  // print((s1 as StaticClass).sum2(20));
  // s1 = null;
  // print(s1.sum2(20));
}

void personDemo() {
  // Person p = Person("aaa", 1, 100);
}

void factoryDemo() {
  FactoryClass fact1 = FactoryClass();
  FactoryClass fact2 = FactoryClass();
  print(fact2 == fact1);

}




