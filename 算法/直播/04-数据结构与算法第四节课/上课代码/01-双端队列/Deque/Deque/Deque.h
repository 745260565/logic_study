//
//  LRUCache.h
//  LRUCache
//
//  Created by ws on 2022/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Deque : NSObject
- (instancetype)initWithCapacity:(NSUInteger)numItems;
- (id)fisrtValue;
- (id)lastValue;

// 头部添加数据
- (void)pushValueToHead:(id)n;
// 从头部删除数据
- (void)popValueFromHead:(id)n;

- (void)enqueue:(NSNumber *)n;
// n -> 头部 弹
- (void)dequeue:(NSNumber *)n;

@end

NS_ASSUME_NONNULL_END
