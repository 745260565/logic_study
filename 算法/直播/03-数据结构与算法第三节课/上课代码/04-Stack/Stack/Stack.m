//
//  Stack.m
//  Stack
//
//  Created by ws on 2022/3/2.
//

#import "Stack.h"
#import <objc/runtime.h>

static size_t const SIZE = PAGE_MIN_SIZE;
static uint8_t const SCRIBBLE = 0xA3;  // 0xA3A3A3A3 after releasing
#   define POOL_BOUNDARY nil

@interface Stack() {
    @package
    // id = void *
    // _next -> 对象地址 id *  = void **
    id * _next;
}

@end

// stack -> 后面存储next数据
@implementation Stack

- (instancetype)init
{
    self = [super init];
    if (self) {
        // _next -> 结构体的尾巴
        _next = self.begin;
    }
    return self;
}
// push

// obj -> next ->位置
- (id *)push {
    // 我要push一组数据
    return [self add:POOL_BOUNDARY];
}

- (void)autorelease:(id)obj {
    [self add:obj];
}

- (id *)add:(id)obj {
    assert(!self.full);
    id *ret = _next;
    // *next = obj
    // next = next + 1
    *_next++ = obj;
    return ret;
}
// ctx1
- (void)pop:(id *)stop {
    while (self->_next != stop) {
        id obj = *--_next;
        // 0xA3-》
        memset((void*)_next, SCRIBBLE, sizeof(*_next));
        // 0xA3 -》release？
        [obj release];
    }
}

// 0x000000010202e140
// 5e0 + 16 =
// end
- (id *)end {
    return (id *) ((uint8_t *)self + SIZE);
}

- (BOOL)full {
    return _next == [self end];
}

// pop

// mrc
- (id *)begin {
    return (id *)((uint8 *)self + class_getInstanceSize(self.class));
}

- (NSString *)description {
    NSMutableString *all = [NSMutableString stringWithString:@"\n|----------------------Stack--------------------|\n"];
    int index = 0;
    id *next = self->_next;
    while (next != self.begin) {
        id *address = --next;
        id obj = *address;
        [all appendString:[NSString stringWithFormat:@"|--address:--%p---value:--%p--|\n", address,obj]];
        index++;
    }
    return all;
}
@end
