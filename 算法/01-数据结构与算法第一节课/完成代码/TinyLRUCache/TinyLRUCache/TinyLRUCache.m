//
//  TinyLRUCache.m
//  TinyLRUCache
//
//  Created by ws on 2022/2/9.
//

#import "TinyLRUCache.h"

// Array <key-value>
// key存在的时候，更新key

@interface Entry : NSObject

@property (strong, nonatomic) id key;
@property (strong, nonatomic) id object;

+ (instancetype)entryWithObject:(id)object forKey:(id)key;

@end

@implementation Entry
+ (instancetype)entryWithObject:(id)object forKey:(id)key {
    Entry *entry = [self new];
    entry.key = key;
    entry.object = object;
    return entry;
}

@end


@interface TinyLRUCache() {
    NSUInteger _numItems;
    NSMutableArray <Entry *>*_cache;
}

@end

@implementation TinyLRUCache
- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [super init];
    if (self) {
        _numItems = numItems;
        // malloc
        _cache = [NSMutableArray arrayWithCapacity:numItems];
    }
    return self;
}
/**
 1. removeNode
 1. moveNodeToHead
 2. removeTailNode
 3. addNodeToHead
 */
- (nullable id)objectForKey:(id<TinyLRUCachePolicy>)aKey {
    
    for (size_t i = 0; i < _cache.count; i++) {
        // key没有命中
        if (_cache[i].key != aKey) {
            continue;
        }
        // key命中_cache
        if (i == _cache.count - 1) {
            return _cache[i].object;
        }
        
        // key命中,不是_cache的末尾
        Entry *entry = _cache[i];
        [_cache removeObjectAtIndex:i];
        [_cache addObject:entry];
        return _cache[_cache.count - 1].object;
    }
    // 1.遍历完成 -》
    if (_cache.count == _numItems) {
        [_cache removeObjectAtIndex:0];
    }
    
    if ([aKey respondsToSelector:@selector(createValue)]) {
        [_cache addObject:[Entry entryWithObject:[aKey createValue] forKey:aKey]];
    }
    
    return _cache.lastObject.object;
}

- (NSString *)description {
    if (_cache.count == 0) {
        return @"<empty cache>";
    }
    NSMutableString *all = [NSMutableString stringWithString:@"\n|------------TinyLRUCache----------|\n"];

    [_cache enumerateObjectsUsingBlock:^(Entry * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [all appendString:[NSString stringWithFormat:@"|-%lu-|--key:--%@--value:--%@--|\n",(unsigned long) (unsigned long)idx, obj.key, obj.object]];
    }];
    return all;
}

@end

