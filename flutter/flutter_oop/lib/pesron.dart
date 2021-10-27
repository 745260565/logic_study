
//初始化列表，目的：给final变量赋值，校验传递的值
class Person {
  String? name;
  int? age;
  int? height;
  bool get isFree => height! < 110;

  // Person() {
  //   print("Person 构造");
  // }
  Person(this.age);
  Person.init();
  Person.withName(this.name);

  // Person(this.name,this.age,int h)
  //     :height = h,assert(h >= 0),assert(age>=0){
  //   print("name:$name age:$age height:$height");
  // }
  run() {
    print("Person run ...");
  }
}