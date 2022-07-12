//
//  ViewController.m
//  TraceDemo
//
//  Created by allin on 2022/2/19.
//

#import "ViewController.h"
#include <stdint.h>
#include <stdio.h>
#include <sanitizer/coverage_interface.h>

#import <dlfcn.h>
#import <libkern/OSAtomic.h>

#import "TraceDemo-Swift.h"

@interface ViewController ()

//@property (nonatomic ,copy) NSString *str;
@property (nonatomic ,assign) int age;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SwiftTest swiftTest];
}

//原子队列 线程安全 先进后出 (/*只能保存结构体*/不用讲)
static OSQueueHead symbolList = OS_ATOMIC_QUEUE_INIT;

typedef struct {
    void * pc;
    int abc;
} SYNode;

void __sanitizer_cov_trace_pc_guard_init(uint32_t *start,
                                         uint32_t *stop) {
    static uint64_t N;
    if (start == stop || *start) return;
    printf("INIT: %p %p\n", start, stop);
    for (uint32_t *x = start; x < stop; x++)
        *x = ++N;
    NSLog(@"%d",N);
}

void __sanitizer_cov_trace_pc_guard(uint32_t *guard) {
//    NSLog(@"%s",__func__);
    if (!*guard) return;
    void *PC = __builtin_return_address(0);
    
    SYNode *node = malloc(sizeof(SYNode));
    *node = (SYNode){PC,0};
    
    //插入结构体
    OSAtomicEnqueue(&symbolList, node, offsetof(SYNode, abc));
    
//    printf("%s\n",info.dli_sname);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //创建数组
    NSMutableArray *symbleNames = [NSMutableArray array];
    while (YES) {
        SYNode *node = OSAtomicDequeue(&symbolList, offsetof(SYNode, abc));
        if (node == NULL) {
            break;;
        }
        Dl_info info;
        dladdr(node->pc, &info);
        //转为OC字符串方便操作
        NSString *name = @(info.dli_sname);
        //
        //OC方法 直接添加到数组
//        if ([name hasPrefix:@"+["] || [name hasPrefix:@"-["]) {
//            [symbleNames addObject:name];
//            continue;
//        }
//        [symbleNames addObject:];
        BOOL isObjc = [name hasPrefix:@"+["] || [name hasPrefix:@"-["];
        NSString * symbleName = isObjc ? name : [@"_" stringByAppendingString:name];
        [symbleNames addObject:symbleName];
    }
    
//    symbleNames = (NSMutableArray *)[[symbleNames reverseObjectEnumerator] allObjects];
    
    NSEnumerator *em = [symbleNames reverseObjectEnumerator];
    //新数组存储
    NSMutableArray *funcs = [NSMutableArray arrayWithCapacity:symbleNames.count];
    NSString *name;
    while (name = [em nextObject]) {
        if (![funcs containsObject:name]) {
            [funcs addObject:name];
        }
    }
    
    //数组转为字符串
    NSString *funcStr = [funcs componentsJoinedByString:@"\n"];
    //文件路径
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"lg.order"];
    //文件内容
    NSData *file = [funcStr dataUsingEncoding:NSUTF8StringEncoding];
    //写入文件
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:file attributes:nil];
    //获取沙盒主目录路径
    NSLog(@"%@",NSHomeDirectory());
    
    NSLog(@"%@",funcStr);
}

void test(void) {
    NSLog(@"%s",__func__);
}

void (^block) (void) = ^{
    NSLog(@"%s",__func__);
};

@end

