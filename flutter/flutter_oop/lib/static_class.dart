

class StaticClass {
  //静态属性
  static int count = 1;
  int currentCount = 10;

  static const String str = "chenghao";

  //静态方法
  static int sum(int a) {
    return a + count;
  }

  int sum2(int a) {
    return currentCount + a + count;
  }
}