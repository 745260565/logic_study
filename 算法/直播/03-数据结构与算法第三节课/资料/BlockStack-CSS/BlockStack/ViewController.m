//
//  ViewController.m
//  BlockStack
//
//  Created by ws on 2022/2/14.
//

#import "ViewController.h"
#import "LGTokenizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LGTokenizer *t = [[LGTokenizer alloc] initWithString:@"121(2{1}23)2212"];
}


@end
