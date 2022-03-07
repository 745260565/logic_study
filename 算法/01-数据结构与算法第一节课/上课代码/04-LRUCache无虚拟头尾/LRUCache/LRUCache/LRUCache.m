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
  
}

- (void)moveNodeToHead:(_DoubleLinkNode *)node {
    
}

- (void)removeNode:(_DoubleLinkNode *)node {
    
}

- (_DoubleLinkNode *)removeTailNode {
    
    return nil;
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
    
    return nil;
}

- (NSString *)description {
    if (_numItems == 0) {
        return @"<empty cache>";
    }
    NSMutableString *all = [NSMutableString stringWithString:@"\n|------------LRUCache----------|\n"];
    /**
     _DoubleLinkNode *node = _lru->_head;
     int index = 0;
     while (node && node->_key) {
         [all appendString:[NSString stringWithFormat:@"|-%d-|--key:--%@--value:--%@--|\n",index, node->_key, node->_value]];
         node = node->_next;
         index++;
     }
     */
    
    return all;
}
@end
