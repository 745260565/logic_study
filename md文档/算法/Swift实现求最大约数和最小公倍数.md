### 一、最大公约数

如果有一个自然数a能被自然数b整除，则称a为b的倍数，b为a的约数。几个自然数公有的约数，叫做这几个自然数的公约数。公约数中最大的一个公约数，称为这几个自然数的最大公约数。

**辗转相除法**

辗转相除法， 又名欧几里德算法（Euclidean algorithm），是求最大公约数的一种方法。它的具体做法是：用较小数除较大数，再用出现的余数（第一余数）去除除数，再用出现的余数（第二余数）去除第一余数，如此反复，直到最后余数是0为止。如果是求两个数的最大公约数，那么最后的除数就是这两个数的最大公约数。

swift代码实现

```swift
func greatestCommonDivisor(m: Int, n: Int) -> Int {
    var min = min(m, n)
    var max = max(m, n)
    var temp = 0
    while max%min != 0 {
        temp = max%min
        max = min
        min = temp
    }
    return min
}
```

### 二、最大公倍数

最小公倍数（Least Common Multiple，LCM），如果有一个自然数a能被自然数b整除，则称a为b的倍数，b为a的约数，对于两个整数来说，指该两数共有倍数中最小的一个。计算最小公倍数时，通常会借助最大公约数来辅助计算。

最小公倍数=两数的乘积/最大公约数

swift代码实现

```
func leastCommonMultiple(m: Int, n: Int) -> Int {
    return m*n/greatestCommonDivisor(m: m, n: n)
}
```

