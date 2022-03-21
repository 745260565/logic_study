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
    _DoubleLinkNode *_prev;
    _DoubleLinkNode *_next;
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
        // 虚拟头部和虚拟尾部节点
        _head = [_DoubleLinkNode new];
        _tail = [_DoubleLinkNode new];
        _head->_next = _tail;
        _tail->_prev = _head;
    }
    return self;
}

- (void)addNodeToHead:(_DoubleLinkNode *)node {
    _dic[node->_key] = node;
    _count++;
    node->_prev = _head;
    node->_next = _head->_next;
    node->_next->_prev = node;
    _head->_next = node;
}

- (void)moveNodeToHead:(_DoubleLinkNode *)node {
    [self removeNode:node];
    [self addNodeToHead:node];
}

- (void)removeNode:(_DoubleLinkNode *)node {
    [_dic removeObjectForKey:node->_key];
    _count--;
    node->_prev->_next = node->_next;
    node->_next->_prev = node->_prev;
}

- (_DoubleLinkNode *)removeTailNode {
    _DoubleLinkNode *node = _tail->_prev;
    [self removeNode:node];
    return node;
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

    _DoubleLinkNode *node = _lru->_head->_next;
    int index = 0;
    while (node && node->_key) {
        [all appendString:[NSString stringWithFormat:@"|-%d-|--key:--%@--value:--%@--|\n",index, node->_key, node->_value]];
        node = node->_next;
        index++;
    }
    return all;
}
@end
