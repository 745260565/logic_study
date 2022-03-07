//
//  main.m
//  LRUCache
//
//  Created by ws on 2022/2/24.
//

#import <Foundation/Foundation.h>
#import "LRUCache.h"


@implementation NSString(TinyLRUCachePolicy)

- (NSString *)createValue {
    return [NSString stringWithFormat:@"%@_Cat1237", self];
}

@end

int main(int argc, const char * argv[]) {
    LRUCache <NSString *, NSString *>*cache = [[LRUCache alloc] initWithCapacity:5];
    [cache objectForKey:@"1"];
    [cache objectForKey:@"2"];
    [cache objectForKey:@"3"];
    [cache objectForKey:@"4"];
    [cache objectForKey:@"5"];
    [cache objectForKey:@"2"];
//    [cache objectForKey:@"1"];

    NSLog(@"%@", cache);
    return 0;
}
