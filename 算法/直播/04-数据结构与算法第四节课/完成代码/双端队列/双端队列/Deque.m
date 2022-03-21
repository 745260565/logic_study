//
//  LRUCache.m
//  LRUCache
//
//  Created by ws on 2022/2/24.
//

#import "Deque.h"

@interface _DoubleLinkNode : NSObject
{
    @package
    _DoubleLinkNode *_prev;
    _DoubleLinkNode *_next;
    id _value;
}
@end


@implementation _DoubleLinkNode

@end

@interface _DoubleLink : NSObject

@end

@interface _DoubleLink() {
    @package
    NSUInteger _count;
    NSUInteger _capacity;
    _DoubleLinkNode *_head;
    _DoubleLinkNode *_tail;
}

- (void)removeLast;
- (BOOL)isEmpty;
- (id)lastValue;
- (id)fisrtValue;
- (void)addValueToLast:(id)n;

@end

@implementation _DoubleLink
- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self) {
        _capacity = numItems;
    }
    return self;
}

- (void)addNodeToHead:(_DoubleLinkNode *)node {
    _count++;
    if (_head) {
        node->_next = _head;
        _head->_prev = node;
        _head = node;
    } else {
        _head = _tail = node;
    }
}

- (void)addNodeToTail:(_DoubleLinkNode *)node {
    _count++;
    if (_tail) {
        _tail->_next = node;
        node->_prev = _tail;
        _tail = node;
    } else {
        _head = _tail = node;
    }
}


- (void)moveNodeToHead:(_DoubleLinkNode *)node {
    if (_head == node) return;
    
    if (_tail == node) {
        _tail = node->_prev;
        _tail->_next = nil;
    } else {
        node->_next->_prev = node->_prev;
        node->_prev->_next = node->_next;
    }
    node->_next = _head;
    node->_prev = nil;
    _head->_prev = node;
    _head = node;
}

- (void)removeNode:(_DoubleLinkNode *)node {
    _count--;
    if (node->_next) node->_next->_prev = node->_prev;
    if (node->_prev) node->_prev->_next = node->_next;
    if (_head == node) _head = node->_next;
    if (_tail == node) _tail = node->_prev;
}

- (_DoubleLinkNode *)removeTailNode {
    if (!_tail) return nil;
    _DoubleLinkNode *tail = _tail;
    _count--;
    if (_head == _tail) {
        _head = _tail = nil;
    } else {
        _tail = _tail->_prev;
        _tail->_next = nil;
    }
    return tail;
}

- (BOOL)isEmpty {
    return _count == 0;
}

- (NSNumber *)lastValue {
   return _tail->_value;
}

- (NSNumber *)fisrtValue {
   return _head->_value;
}

- (void)removeLast {
    [self removeTailNode];
}

// 移除双链表首部
- (void)removeFirst {
    [self removeNode:_head];
}

// 像双链表首部添加n
- (void)addValueToHead:(id)n {
    _DoubleLinkNode *node = [_DoubleLinkNode new];
    node->_value = n;
    [self addNodeToHead:node];
}
// 像双链表尾部添加n
- (void)addValueToLast:(id)n {
    _DoubleLinkNode *node = [_DoubleLinkNode new];
    node->_value = n;
    [self addNodeToTail:node];
}

@end




@interface Deque() {
    _DoubleLink *_dLink;
    NSUInteger _numItems;
}

@end

@implementation Deque

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self) {
        _numItems = numItems;
        _dLink = [[_DoubleLink alloc] initWithCapacity:numItems];
    }
    return self;
}

- (id)fisrtValue {
    return [_dLink fisrtValue];
}

- (id)lastValue {
    return [_dLink lastValue];
}

- (void)pushValueToHead:(id)n {
    [_dLink addValueToHead:n];
}

- (void)popValueFromHead:(id)n {
    [_dLink removeFirst];
}

- (void)enqueue:(NSNumber *)n {
    // 将小于n的元素全部删除
    while (!_dLink.isEmpty && ([_dLink.lastValue compare: n] == NSOrderedAscending)) {
        [_dLink removeTailNode];
    }
    // 然后将 n 加入tail
    [_dLink addValueToLast:n];
}

- (void)dequeue:(NSNumber *)n {
    if ([n compare: _dLink.fisrtValue] == NSOrderedSame) {
        [_dLink removeFirst];
    }
}

- (NSString *)description {
    if (_numItems == 0) {
        return @"<empty cache>";
    }
    NSMutableString *all = [NSMutableString stringWithString:@"\n|------------LRUCache----------|\n"];

    _DoubleLinkNode *node = _dLink->_head;
    int index = 0;
    while (node) {
        [all appendString:[NSString stringWithFormat:@"|-%d-|----value:--%@--|\n",index, node->_value]];
        node = node->_next;
        index++;
    }
    return all;
}
@end
