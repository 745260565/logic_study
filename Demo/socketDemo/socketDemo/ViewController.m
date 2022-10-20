//
//  ViewController.m
//  socketDemo
//
//  Created by chenghao on 2022/10/18.
//

#import "ViewController.h"
#import <sys/socket.h>//>
#import <netinet/in.h>//>

@interface ViewController ()
@property(nonatomic, assign) int clinenId;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    struct sockaddr_in socketAddr;
    socketAddr.sin_family = AF_INET;
    socketAddr.sin_port = SocketPort;
    struct in_addr socketIn_addr;
    socketIn_addr.s_addr = SocketIP;
    socketAddr.sin_addr = socketIn_addr;
    
    
    int socketId = socket(AF_INET, SOCK_STREAM, 0);
    self.clinenId = socketId;
    if (socketId == -1) {
        NSLog(@"创建socket失败");
        return;
    }
    
    int result = connect(socketId, (const struct sockaddr *)&socketAddr, sizeof(socketAddr));
    if (result != 0) {
        NSLog(@"连接失败");
        return;
    }
    NSLog(@"连接成功");
    
    
    
    // Do any additional setup after loading the view.
}

@end
