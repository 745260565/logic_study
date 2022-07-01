### 一、LLVM概述

LLVM是架构编译器的框架系统，以C++编写，用于优化以任意程序语言编写的编译时间，链接时间，运行时间以及空闲时间，对开发都保持开发，并兼容已有脚本

###### 传统编译器：

SourceCode -- Frontend -- Optimizer -- Backend -- MachineCode

编译器前端（Frontend）

编译器前端的任务是解析源代码，会进行词法分析，语法分析，语义分析，检查源代码是否存大错误，然后构建抽象语法树（AST），LLVM的前端还会生成中间代码（IR）

优化器（Optimizer）

优化器负责进行各种优化。改善代码的运行时间，如消除冗余计算等

后端（Backend）/代码生成器（CodeGenerator）

将代码映射到目标指令集。生成机器语言，并且进行机器相关的代码优化

###### iOS编译器架构

OC/C/C++使用的编译器是Clang，Swift是Swift，后端都是LLVM

<img src="/Users/chenghao/Desktop/图片.png" alt="图片" style="zoom:30%;" />

###### LLVM的设计

当编译器决定支持多种源语言或多种硬件架构时，LLVM最重要的地方就来了，其它编译器如GCC，它方法非常成功，但由于它是作为整体应用程序设计的，因此它们的用途受到了很大的限制。

LLVM设计的最重要方面是，使用通用的代码表示形式（IR），它是用来在编译器中表示代码的形式。所以LLVM可以为任何编程语言独立编写前端，并且可以为任意架构独立编写后端

<img src="/Users/chenghao/Desktop/图片1.png" alt="图片1" style="zoom:70%;" />

###### Clang

Clang是LLVM项目中的一个子项目，它是基于LLVM架构的轻量级编译器，诞生之初是为了替代GCC，提供更快的编译速度。它是负责编译C、C++、OC语言的编译器，它属于整个LLVM架构中的编译器前端。

### 二、编译流程

###### 通过命令打印源码的编译

```
clang -ccc-print-phases main.m
```

```objective-c
               +- 0: input, "main.m", objective-c
            +- 1: preprocessor, {0}, objective-c-cpp-output
         +- 2: compiler, {1}, ir
      +- 3: backend, {2}, assembler
   +- 4: assembler, {3}, object
+- 5: linker, {4}, image
6: bind-arch, "x86_64", {5}, image
```

0:输入文件：找到源文件

1:预处理阶段：这个过程处理包括宏的替换，头文件的导入

2:编译阶段：进行词法分析、语法分析、检测语法是否下确，最终生成IR。

3:后端：这里LLVM会通过一个一个的Pass去优化，每个Pass做一些事件，最终生成汇编代码。

4:生成目标文件

5:链接：链接需要的动态库和静态库存，生成可执行文件

6:通过不同的架构，生成对应的可执行文件

###### 预处理阶段

```objective-c
clang -E main.m
```

执行完可以看到头文件的导入和宏的替换