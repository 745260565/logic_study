//
//  ViewController.m
//  OCTest
//
//  Created by ChengHao on 2022/1/13.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *firstString = @"helloworld";
    NSString *secondString = [NSString stringWithFormat:@"helloworld"];
    NSString *thirdString = @"hello";
    NSString *fourthString = [NSString stringWithFormat:@"hello"];
    
    NSLog(@"%p %@",firstString,[firstString class]);
    NSLog(@"%p %@",secondString,[secondString class]);
    NSLog(@"%p %@",thirdString,[thirdString class]);
    NSLog(@"%p %@",fourthString,[fourthString class]);
    // Do any additional setup after loading the view.
}


@end
