

//
//  NSString+TokenizerInputStream.m
//  MxCSSParserKit
//
//  Created by 016 on 2018/9/11.
//  Copyright © 2018年 016. All rights reserved.
//

#import "NSString+TokenizerInputStream.h"
#import <objc/runtime.h>
#import "LGHelper.h"

@implementation NSString (TokenizerInputStream)

- (void)setOffset:(NSUInteger)offset
{
  
    objc_setAssociatedObject(self, _cmd, @(offset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSUInteger)offset
{
    NSNumber *num = objc_getAssociatedObject(self, @selector(setOffset:));
    return num ? num.unsignedIntegerValue : num.integerValue;
}
- (unichar)nextInputChar
{
    if (self.offset >= self.length) {
        return '\0';
    }
    unichar result = [self characterAtIndex:self.offset];
    return result ? result : 0xFFFD;
}
- (unichar)peekWithoutReplacement:(NSUInteger)lookaheadOffset
{
    if (self.offset + lookaheadOffset >= self.length) {
        return '\0';
    }
    return [self characterAtIndex:self.offset + lookaheadOffset];
}
- (void)advance:(NSUInteger)offset
{
    self.offset = self.offset + offset;
}
- (void)advance
{
    self.offset += 1;
}
- (void)pushBack:(unichar)cc
{
    --self.offset;
    NSAssert([self nextInputChar] == cc, @"");
}
- (double)getDouble:(NSUInteger)start end:(NSUInteger)end
{
    NSAssert(start <= end && ((self.offset + end) <= self.length), @"");
    double result = 0.0;
    if (start < end) {
        result = [self substringWithRange:NSMakeRange(start + self.offset, end - start)].doubleValue;
    }
    return result;
}
- (NSUInteger)skipWhilePredicate:(NSUInteger)offset characterPredicate:(BOOL (^)(unichar))characterPredicate
{
    if (!characterPredicate) {
        return offset;
    }
    while (self.offset + offset < self.length && characterPredicate([self characterAtIndex:self.offset + offset])) {
        ++offset;
    }
    return offset;
}
- (void)advanceUntilNonWhitespace
{
    while (self.offset < self.length && LGIsHTMLSpace([self characterAtIndex:self.offset])) {
        ++self.offset;
    }
}

@end
