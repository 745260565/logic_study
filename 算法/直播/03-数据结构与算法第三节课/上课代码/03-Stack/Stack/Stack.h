//
//  Stack.h
//  Stack
//
//  Created by ws on 2022/3/2.
//

#import <Foundation/Foundation.h>

// 自动释放 -》stack -〉
// stack -》 先入后出 -〉

@interface Stack : NSObject
- (id *)push:(id)obj;
- (void)pop:(id *)stop;
@end

