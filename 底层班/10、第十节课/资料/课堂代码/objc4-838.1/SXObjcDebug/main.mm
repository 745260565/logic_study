//
//  main.m
//  SXObjcDebug
//
//  Created by Allin on 2022/4/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface LGPerson : NSObject

@property (nonatomic ,copy) NSString *hobby;
-(void)printClassAllMethod:(Class)cls;
-(void)test;

@end

@implementation LGPerson

+(void)load {
    
}

-(void)test {
    NSLog(@"%s",__func__);
}

#pragma mark - 打印当前类的MethodList
-(void)printClassAllMethod:(Class)cls{
    
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    for (unsigned int i = 0; i<count; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        IMP imp = class_getMethodImplementation(cls, sel);
        NSLog(@"%@-%p",NSStringFromSelector(sel),imp);
    }
    free(methodList);
}

@end

@interface LGPerson (LG)

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,assign) int age;
-(void)test;
-(void)category_instanceMethod;
+(void)categoty_classMethod;


@end

@implementation LGPerson (LG)

+(void)load {
    
}

-(void)test {
    NSLog(@"%s",__func__);
}

-(void)category_instanceMethod {
    NSLog(@"%s",__func__);
}

+(void)categoty_classMethod {
    NSLog(@"%s",__func__);
}

static const char *LGNameKey = "LGNameKey";
-(void)setName:(NSString *)name {
    objc_setAssociatedObject(self, LGNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)name {
    return objc_getAssociatedObject(self, LGNameKey);
}


@end

struct LGObjc {
    LGObjc() { printf("%s \n",__func__); }
    ~LGObjc() { printf("%s \n",__func__); }
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        LGPerson *p = [LGPerson alloc];
        [p printClassAllMethod:p.class];
        
        LGObjc objc;
    }
    return 0;
}
