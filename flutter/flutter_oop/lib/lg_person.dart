

void test() {
  LGPerson p = LGPerson(19,"sdkfkjl",19);
  // p.age = 18;
  p._run();
}

/**
 * Dart默认生成setter/getter方法，用.来访问
 * final定义的属性必须定义初始值
 * Dart不能方法重载
 * 当一个对象所有的成员属性都是final的时候，那么这个对象可以被创建为常量对象
 */


class LGPerson {
  final String _name;
  final int? age;
  final height;

  const LGPerson(this.age, this._name, this.height);

  //命名构造函数
  LGPerson.withName(this._name, this.height, this.age);

  // void changeAge(int age) {
  //   this.age = age;
  // }

  void _run() {
    print("name:$_name age: $age");
  }

  void printP() {
    _run();
  }
}