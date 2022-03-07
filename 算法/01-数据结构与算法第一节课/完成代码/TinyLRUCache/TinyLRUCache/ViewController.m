//
//  ViewController.m
//  TinyLRUCache
//
//  Created by ws on 2022/2/12.
//

#import "ViewController.h"
#import "TinyLRUCache.h"

@implementation NSString(TinyLRUCachePolicy)

- (NSString *)createValue {
    return [NSString stringWithFormat:@"%@_Cat1237", self];
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TinyLRUCache <NSString *, NSString *>*cache = [[TinyLRUCache alloc] initWithCapacity:5];
    NSLog(@"%@", [cache objectForKey:@"1"]);
    NSLog(@"%@", [cache objectForKey:@"2"]);
    NSLog(@"%@", [cache objectForKey:@"3"]);
    NSLog(@"%@", [cache objectForKey:@"4"]);
    NSLog(@"%@", [cache objectForKey:@"5"]);
    NSLog(@"%@", [cache objectForKey:@"2"]);

    NSLog(@"%@", cache);
    
}


@end
