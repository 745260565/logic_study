//
//  LRUCache.h
//  LRUCache
//
//  Created by ws on 2022/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol TinyLRUCachePolicy <NSObject>

- (id)createValue;

@end

@interface LRUCache<__covariant KeyType, __covariant ObjectType> : NSObject
- (instancetype)initWithCapacity:(NSUInteger)numItems;

- (nullable ObjectType)objectForKey:(KeyType<TinyLRUCachePolicy>)aKey;

@end

NS_ASSUME_NONNULL_END
