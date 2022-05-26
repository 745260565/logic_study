//
//  ViewController.m
//  dispatch_barrier
//
//  Created by chenghao on 2022/5/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });
    
    // Do any additional setup after loading the view.
}


@end
