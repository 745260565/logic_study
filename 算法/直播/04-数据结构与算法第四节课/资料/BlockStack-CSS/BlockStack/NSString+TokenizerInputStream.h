//
//  NSString+TokenizerInputStream.h
//  MxCSSParserKit
//
//  Created by 016 on 2018/9/11.
//  Copyright © 2018年 016. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TokenizerInputStream)
@property (nonatomic, readonly) NSUInteger offset;
- (unichar)nextInputChar;
- (unichar)peekWithoutReplacement:(NSUInteger)lookaheadOffset;
- (void)advance:(NSUInteger)offset;
- (void)advance;
- (void)pushBack:(unichar)cc;
- (double)getDouble:(NSUInteger)start end:(NSUInteger)end;
- (NSUInteger)skipWhilePredicate:(NSUInteger)offset characterPredicate:(BOOL(^)(unichar c))characterPredicate;
- (void)advanceUntilNonWhitespace;
@end
