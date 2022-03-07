//
//  TinyLRUCache.m
//  TinyLRUCache
//
//  Created by ws on 2022/2/9.
//

#import "TinyLRUCache.h"
// Entry -> cahce条目 -》
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
        _cache = [NSMutableArray arrayWithCapacity:numItems];
    }
    return self;
}
// key -》value value不存在 -〉createValue
// array[0] = 头
// array[last] = 尾
// O(n) = 32

// bringNodeToLast
// removeFirstNode
// addNodeToLast
// 最近最多使用 头 尾
//
- (nullable id)objectForKey:(id<TinyLRUCachePolicy>)aKey {
    
    for (int i = 0; i < _cache.count; i++) {
        // key没有命中
        if (_cache[i].key != aKey) {
            continue;
        }
        // key命中 -> 最近最多使用 -》最近最多使用-〉数组的底部
        if (i == _cache.count - 1) {
            return _cache[i].object;
        }
        // key命中 -》要动 -〉数组的底部
        Entry *entry = _cache[i];
        [_cache removeObjectAtIndex:i];
        [_cache addObject:entry];
        return _cache[_cache.count - 1].object;
    }
    
    // 最近最少使用
    if (_cache.count == _numItems) {
        [_cache removeObjectAtIndex:0];
    }
    // key没有命中
    if ([aKey respondsToSelector:@selector(createValue)]) {
        // 底 -》最近最多使用
        [_cache addObject:[Entry entryWithObject:[aKey createValue] forKey:aKey]];
    }
    return nil;
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

