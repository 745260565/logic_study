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

// yymemcache ->
@implementation _DoubleLinkNode

@end

@interface _DoubleLink : NSObject

@end

@interface _DoubleLink() {
    @package
    NSMutableDictionary *_dic;
    _DoubleLinkNode * _head;
    _DoubleLinkNode * _tail;
    NSUInteger _count;
    NSUInteger _capacity;

}
// 实际开发 -》OC
// 99% -〉并发
// YYM博客
// 周 -》基础数据 + 算法
// yy -〉stack/queue -》auto
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
        // 初始化hash表
        _dic = [NSMutableDictionary dictionaryWithCapacity:numItems];
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
    // 指向head
     node->_prev = _head;
     node->_next = _head->_next;
     _head->_next->_prev = node;
    _head->_next = node;
}

- (void)moveNodeToHead:(_DoubleLinkNode *)node {
    [self removeNode:node];
    [self addNodeToHead:node];
}
// 最近最少使用 -》node 尾部
// 最近最多使用 -〉node 头部
- (void)removeNode:(_DoubleLinkNode *)node {
    [_dic removeObjectForKey:node->_key];
    _count--;
    node->_prev->_next = node->_next;
    node->_next->_prev = node->_prev;
}

- (_DoubleLinkNode *)removeTailNode {
    //最后一个node
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
    // O(1) -> YYMCache
    _DoubleLinkNode *node = _lru->_dic[aKey];
    id value = nil;
    if ([aKey respondsToSelector:@selector(createValue)]) {
        value = [aKey createValue];
    }
    if (node) {
        // 更新value
        node->_value = value;
        [_lru moveNodeToHead:node];
    } else {
        if (_lru->_count == _numItems) {
            [_lru removeTailNode];
        }
        node = [_DoubleLinkNode new];
        node->_key = aKey;
        node->_value = value;
        [_lru addNodeToHead:node];
    }
    return nil;
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
