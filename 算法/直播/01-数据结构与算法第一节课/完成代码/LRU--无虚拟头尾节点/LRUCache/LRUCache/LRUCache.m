//
//  LRUCache.m
//  LRUCache
//
//  Created by ws on 2022/2/24.
//

#import "LRUCache.h"

@interface _DoubleLinkNode : NSObject
{
    @package
    __weak _DoubleLinkNode *_prev;
    __weak _DoubleLinkNode *_next;
    id _key;
    id _value;
}
@end


@implementation _DoubleLinkNode

@end

@interface _DoubleLink : NSObject

@end

@interface _DoubleLink() {
    @package
    NSMutableDictionary *_dic;
    NSUInteger _count;
    NSUInteger _capacity;
    _DoubleLinkNode *_head;
    _DoubleLinkNode *_tail;
}
- (void)addNodeToHead:(_DoubleLinkNode *)node;

- (void)moveNodeToHead:(_DoubleLinkNode *)node;

- (void)removeNode:(_DoubleLinkNode *)node;

- (_DoubleLinkNode *)removeTailNode;

@end

@implementation _DoubleLink
- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self) {
        _capacity = numItems;
        _dic = [NSMutableDictionary dictionaryWithCapacity:numItems];
    }
    return self;
}

- (void)addNodeToHead:(_DoubleLinkNode *)node {
    _dic[node->_key] = node;
    _count++;
    if (_head) {
        node->_next = _head;
        _head->_prev = node;
        _head = node;
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
    [_dic removeObjectForKey:node->_key];
    _count--;
    if (node->_next) node->_next->_prev = node->_prev;
    if (node->_prev) node->_prev->_next = node->_next;
    if (_head == node) _head = node->_next;
    if (_tail == node) _tail = node->_prev;
}

- (_DoubleLinkNode *)removeTailNode {
    if (!_tail) return nil;
    _DoubleLinkNode *tail = _tail;
    [_dic removeObjectForKey:_tail->_key];
    _count--;
    if (_head == _tail) {
        _head = _tail = nil;
    } else {
        _tail = _tail->_prev;
        _tail->_next = nil;
    }
    return tail;
}

@end

@interface LRUCache() {
    _DoubleLink *_lru;
    NSUInteger _numItems;
}

@end

@implementation LRUCache

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self) {
        _numItems = numItems;
        _lru = [[_DoubleLink alloc] initWithCapacity:numItems];
    }
    return self;
}

- (nullable id)objectForKey:(id<TinyLRUCachePolicy>)aKey {
    _DoubleLinkNode *node = _lru->_dic[aKey];
    id value = nil;
    if ([aKey respondsToSelector:@selector(createValue)]) {
        value = [aKey createValue];
    }
    if (node) {
        node->_value = value;
        [_lru moveNodeToHead:node];
    } else {
        // 超出限制，删除双向链表的尾部节点
        if (_lru->_count == _numItems) {
            [_lru removeTailNode];
        }
        node = [_DoubleLinkNode new];
        node->_key = aKey;
        node->_value = value;
        [_lru addNodeToHead:node];
    }
    return node;
}

- (NSString *)description {
    if (_numItems == 0) {
        return @"<empty cache>";
    }
    NSMutableString *all = [NSMutableString stringWithString:@"\n|------------LRUCache----------|\n"];

    _DoubleLinkNode *node = _lru->_head;
    int index = 0;
    while (node && node->_key) {
        [all appendString:[NSString stringWithFormat:@"|-%d-|--key:--%@--value:--%@--|\n",index, node->_key, node->_value]];
        node = node->_next;
        index++;
    }
    return all;
}
@end
