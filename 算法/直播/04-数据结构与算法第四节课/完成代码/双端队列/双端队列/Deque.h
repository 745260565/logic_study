//
//  LRUCache.h
//  LRUCache
//
//  Created by ws on 2022/2/24.
//

#import <Foundation/Foundation.h>


@interface Deque : NSObject
- (instancetype)initWithCapacity:(NSUInteger)numItems;
- (id)fisrtValue;
- (id)lastValue;
- (void)pushValueToHead:(id)n;
- (void)popValueFromHead:(id)n;
- (void)enqueue:(NSNumber *)n;
- (void)dequeue:(NSNumber *)n;
@end


