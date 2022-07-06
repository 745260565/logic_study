//
//  NSObject+LG.m
//  KCObjcBuild
//
//  Created by allin on 2021/10/29.
//

#import "NSObject+LG.h"
#import <objc/runtime.h>

@implementation NSObject (LG)

+(BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s,%@",__func__,NSStringFromSelector(sel));

    if (sel == @selector(test1)) {
        /**
         const char *types
         描述方法参数类型的字符数组。描述方法参数类型的字符数组的第一个字符是代表返回值的类型，后面的字符依次代表参数的类型，因为Objective-C中的函数会包含两个隐式参数，也就是方法调用者和方法名，所以类型编码的第二个字符一定是@，第三个字符一定是:
         */
        class_addMethod(self.class, sel, class_getMethodImplementation(self.class, @selector(method1)), "v@:");
        return YES;;
    }
    if (sel == @selector(test2)) {
        /**
         const char *types
         描述方法参数类型的字符数组。描述方法参数类型的字符数组的第一个字符是代表返回值的类型，后面的字符依次代表参数的类型，因为Objective-C中的函数会包含两个隐式参数，也就是方法调用者和方法名，所以类型编码的第二个字符一定是@，第三个字符一定是:
         */
        class_addMethod(objc_getMetaClass("LGPerson"), sel, class_getMethodImplementation(objc_getClass("LGPerson"), @selector(method2)),"v@:");
        return YES;
    }
    //照着苹果文档写
    return NO;
}

- (void)method1 {
    NSLog(@"%s",__func__);
}

- (void)method2 {
    NSLog(@"%s",__func__);
}

@end
