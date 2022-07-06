### 一、LLVM概述

LLVM是架构编译器的框架系统，以C++编写，用于优化以任意程序语言编写的编译时间，链接时间，运行时间以及空闲时间，对开发都保持开发，并兼容已有脚本

###### 1.1、传统编译器：

SourceCode -- Frontend -- Optimizer -- Backend -- MachineCode

**编译器前端（Frontend）**

编译器前端的任务是解析源代码，会进行词法分析，语法分析，语义分析，检查源代码是否存大错误，然后构建抽象语法树（AST），LLVM的前端还会生成中间代码（IR）

**优化器（Optimizer）**

优化器负责进行各种优化。改善代码的运行时间，如消除冗余计算等

**后端（Backend）/代码生成器（CodeGenerator）**

将代码映射到目标指令集。生成机器语言，并且进行机器相关的代码优化

###### 1.2、iOS编译器架构

OC/C/C++使用的编译器是Clang，Swift是Swift，后端都是LLVM

<img src="/Users/chenghao/Desktop/图片.png" alt="图片" style="zoom:30%;" />

###### 1.3、LLVM的设计

当编译器决定支持多种源语言或多种硬件架构时，LLVM最重要的地方就来了，其它编译器如GCC，它方法非常成功，但由于它是作为整体应用程序设计的，因此它们的用途受到了很大的限制。

LLVM设计的最重要方面是，使用通用的代码表示形式（IR），它是用来在编译器中表示代码的形式。所以LLVM可以为任何编程语言独立编写前端，并且可以为任意架构独立编写后端

<img src="/Users/chenghao/Desktop/图片1.png" alt="图片1" style="zoom:70%;" />

**Clang**

Clang是LLVM项目中的一个子项目，它是基于LLVM架构的轻量级编译器，诞生之初是为了替代GCC，提供更快的编译速度。它是负责编译C、C++、OC语言的编译器，它属于整个LLVM架构中的编译器前端。

### 二、编译流程

###### 2.1、通过命令打印源码的编译

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

1:预处理阶段：这个过程处理包括宏的替换，头文件的导入，主要处理以#号开头的命令

2:编译阶段：进行词法分析、语法分析、检测语法是否下确，最终生成IR。

3:后端：这里LLVM会通过一个一个的Pass去优化，每个Pass做一些事件，最终生成汇编代码。

4:生成目标文件

5:链接：链接需要的动态库和静态库存，生成可执行文件

6:通过不同的架构，生成对应的可执行文件

###### 2.2、预处理阶段

```objective-c
clang -E main.m
```

```c
extern int __vsnprintf_chk (char * restrict, size_t, int, size_t,
       const char * restrict, va_list);
# 400 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/stdio.h" 2 3 4
# 9 "main.m" 2

int main(int argc, const char * argv[]) {
    printf("%d",10 + 20));
    return 0;
}
```

执行完可以看到头文件的导入和宏的替换

###### 2.2、编译阶段

**词法分析**

预处理完成后就会进行词法分析，会把代码切成一个个Token，比如大小括号，等于号还有字符串等

```objective-c
clang	-fmodules	-fsyntax-only	-Xclang	-dump-tokens	main.m
```

```c
#define A 10

int main(int argc, const char * argv[]) {
    print'		Loc=<main.m:8:1>
int 'int'	 [StartOfLine]	Loc=<main.m:12:1>
identifier 'main'	 [LeadingSpace]	Loc=<main.m:12:5>
l_paren '('		Loc=<main.m:12:9>
int 'int'		Loc=<main.m:12:10>
identifier 'argc'	 [LeadingSpace]	Loc=<main.m:12:14>
comma ','		Loc=<main.m:12:18>
const 'const'	 [LeadingSpace]	Loc=<main.m:12:20>
char 'char'	 [LeadingSpace]	Loc=<main.m:12:26>
star '*'	 [LeadingSpace]	Loc=<main.m:12:31>
identifier 'argv'	 [LeadingSpace]	Loc=<main.m:12:33>
```

**语法分析**

词法分析完成之后就是语法分析，它的任务是验证语法是否正确。在词法分析的基础上将单词序列组合成各类语法短语，如“程序”，“语句”，“表达式”等等，然后将所有节点组成抽象语法树（Abstract Syntax Tree, AST）。语法分析程序判断源程序在结构上是否正确

```c
clang	-fmodules	-fsyntax-only	-Xclang	-ast-dump	main.m
```

```c
|     `-Record 0x7f9b51062f00 '__va_list_tag'
|-ImportDecl 0x7f9b51063a30 <main.m:8:1> col:1 implicit Darwin.C.stdio
`-FunctionDecl 0x7f9b51063d00 <line:12:1, line:15:1> line:12:5 main 'int (int, const char **)'
  |-ParmVarDecl 0x7f9b51063a88 <col:10, col:14> col:14 argc 'int'
  |-ParmVarDecl 0x7f9b51063bb0 <col:20, col:38> col:33 argv 'const char **':'const char **'
  `-CompoundStmt 0x7f9b51845488 <col:41, line:15:1>
    |-CallExpr 0x7f9b518453f8 <line:13:5, col:23> 'int'
    | |-ImplicitCastExpr 0x7f9b518453e0 <col:5> 'int (*)(const char *, ...)' <FunctionToPointerDecay>
    | | `-DeclRefExpr 0x7f9b518452c0 <col:5> 'int (const char *, ...)' Function 0x7f9b51844e68 'printf' 'int (const char *, ...)'
    | |-ImplicitCastExpr 0x7f9b51845440 <col:12> 'const char *' <NoOp>
    | | `-ImplicitCastExpr 0x7f9b51845428 <col:12> 'char *' <ArrayToPointerDecay>
    | |   `-StringLiteral 0x7f9b51845318 <col:12> 'char [3]' lvalue "%d"
    | `-BinaryOperator 0x7f9b51845378 <line:10:11, line:13:21> 'int' '+'
    |   |-IntegerLiteral 0x7f9b51845338 <line:10:11> 'int' 10
    |   `-IntegerLiteral 0x7f9b51845358 <line:13:21> 'int' 20
    `-ReturnStmt 0x7f9b51845478 <line:14:5, col:12>
      `-IntegerLiteral 0x7f9b51845458 <col:12> 'int' 0
```

###### 2.3、生成中间代码IR（intermediate representation）

完成以上步骤后就开始生成中间代码IR了，代码生成器（Code Generation）会将语法树自顶向下遍历逐步翻译成LLVM IR。通过以下命令生成.ll的文本文件件，查看IR代码

```c
clang	-S	-fobjc-arc	-emit-llvm	main.m
```

Objective C 在这一步会进行runtime桥接：property合成，ARC处理等

执行完成会发现目录下多了一个main.ll文件

**IR基本语法**

```
@ 全局标识
% 局部标识
alloca 开辟空间
align 内存对齐
i32 32个bit,4个字节
store 写入内存
load 读取数据
call 调用函数
ret 返回
```

**IR的优化**

LLVM的优化级别分别是 -O0 -O1 -O2 -O3 -Os（第一个字母是大写O）

```c
clang	-Os	-S	-fobjc-arc	-emit-llvm	main.m	-o	main.ll
```

在Xcode中设置优化等级

<img src="/Users/chenghao/Desktop/WeChate1f8afc8a9871f6679e0a4f86757e83f.png" alt="WeChate1f8afc8a9871f6679e0a4f86757e83f" style="zoom:50%;" />

**bitCode**

xcode7以后开启bitcode苹果会进一步的优化，生成.bc的中间代码。我们通过优化后的IR代码生成.bc代码

```c
clang	-emit-llvm	-c	main.ll	-o	main.bc
```

执行完成发现目录下多了一个main.bc，可以理解bc代码是IR代码的另一种，更进一步的优化，很多第三方不支持bitCode

###### 2.4、生成汇编代码

可以通过最终的.bc或者.ll代码生成汇编代码

```c
clang	-S	-fobjc-arc	main.bc	-o	main.s
clang	-S	-fobjc-arc	main.ll	-o	main.s
```

生成会变代码也可以进行优化

```c
clang	-Os	-S	-fobjc-arc	main.m	-o	main.s
```

执行完后目录下多了一个main.s的汇编文件

###### 2.5、生成目标文件

目标文件的生成，是汇编器以汇编代码作为输入，将汇编代码转换为机器代码，最后输出目标文件（object file）.

```c
clang	-fmodules	-c	main.s	-o	main.o
```

执行完后目录下多了一个main.o的目标文件，通过nm命令，查看main.o中的符号

```shell
chenghao$ nm -nm main.o
                 (undefined) external _printf
0000000000000000 (__TEXT,__text) external _main
```

_printf是一个**undefined external**的

**undefined**表示在当前文件暂时找不到符号_printf

**external**表示这个符号是外部可以访问的

由此可见.o文件不能执行

###### 2.6、生成可执行文件（链接）

连接器把编译生成的.o文件和（.dylib .a）文件，生成一个mach-o文件。

```c
clang	main.o	-o	main
```

执行完后发现目录下多了一个黑色的main可执行文件

<img src="/Users/chenghao/Desktop/WeChat8159cf929b12f92561fb354791d4e616.png" alt="WeChat8159cf929b12f92561fb354791d4e616" style="zoom:50%;" />

查看链接之后的符号

```shell
chenghao$ nm -nm main
                 (undefined) external _printf (from libSystem)
                 (undefined) external dyld_stub_binder (from libSystem)
0000000100000000 (__TEXT,__text) [referenced dynamically] external __mh_execute_header
0000000100003f77 (__TEXT,__text) external _main
0000000100008008 (__DATA,__data) non-external __dyld_private
```

_printf标记了是在libSystem，通过dyld动态链接到libSystem，此过过程就是链接

### 三、总结

至些，iOS项目总源代码到可执行文件流程就清楚了

1. 源代码预编译
2. 编译阶段，通过词法分析、语法分析、生成IR中间代码，最终生成汇编代码
3. 汇编代码生成目标文件，多个目标文件生成可执行文件，其中通过dyld动态链接到其它的库