

class FactoryClass {
  //需要一个单例
  static FactoryClass? _instance;
  factory FactoryClass() => _instance ??= FactoryClass._init();
  // {
  //   // if(_instance == null) {
  //   //   _instance = FactoryClass._init();
  //   // }
  //   // _instance ??= FactoryClass._init();
  //   // return _instance ??= FactoryClass._init();
  // }

  //私有的命名构造函数
  FactoryClass._init();
}