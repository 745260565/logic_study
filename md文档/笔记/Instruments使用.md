微信重签名调试



选中System Trace 

点击左上角开始

选择WeChat-MainThread

左下角选中Virtual Memory（虚拟内存）

![image-20220707162338788](/Users/chenghao/Library/Application Support/typora-user-images/image-20220707162338788.png)

上图为page的数量

如何优化减少page呢，

BuildSetting - link map 

![image-20220707162626435](/Users/chenghao/Library/Application Support/typora-user-images/image-20220707162626435.png)

Write Link Map File设为yes，

编译 - Product - Show Build Folder in Finder，找到

![image-20220707163524397](/Users/chenghao/Library/Application Support/typora-user-images/image-20220707163524397.png)

打开可以看到

![image-20220707164338072](/Users/chenghao/Library/Application Support/typora-user-images/image-20220707164338072.png)

和Compile Sources中的顺序是一致的

![image-20220707164431162](/Users/chenghao/Library/Application Support/typora-user-images/image-20220707164431162.png)

调整Compile Sources中的顺序，AppDelegate和SceneDelegate调到前面

重新build，查看LinkMap

![image-20220707165125726](/Users/chenghao/Library/Application Support/typora-user-images/image-20220707165125726.png)

可以看到appDelegate到了前面

优化，所有启动相关的页码放在前面page里

这个行为就叫二进制重排，重新排列程序的二进制重排

使用.order文件，编译器按.order文件里的顺序进行二进制排列

touch *.order文件，新建.order文件

指定.order文件

那如何知道哪些方法要在前面调用呢？那就要使用到clang插桩