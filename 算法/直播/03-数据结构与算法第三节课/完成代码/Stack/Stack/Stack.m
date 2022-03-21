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
    __unsafe_unretained id * _next;
}

@end

@implementation Stack

- (instancetype)init
{
    self = [super init];
    if (self) {
        _next = [self begin];
    }
    return self;
}

- (id *)push {
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

- (void)pop:(id *)stop {
    while (self->_next != stop) {
        id obj = *--_next;
        // 0xA3A3A3A3
        memset((void*)_next, SCRIBBLE, sizeof(*_next));
        [obj release];
    }
}

- (id *)begin {
    // 头指针 + 结构体大小
    return (id *)((uint8_t *)self + class_getInstanceSize(self.class));
}

- (id *)end {
    return (id *) ((uint8_t *)self + SIZE);
}

- (BOOL)full {
    return _next == [self end];
}

- (BOOL)empty {
    return _next == [self end];
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
