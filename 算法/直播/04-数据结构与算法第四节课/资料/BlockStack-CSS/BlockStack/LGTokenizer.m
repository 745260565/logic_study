//
//  LGParserToken.m
//  BlockStack
//
//  Created by ws on 2022/2/14.
//

#import "LGTokenizer.h"
#import "NSString+TokenizerInputStream.h"
#import "LGHelper.h"
#import <objc/message.h>



typedef NS_ENUM(NSInteger, LGParserTokenType) {
    // (
    LGLeftParenthesisToken,
    // )
    LGRightParenthesisToken,
    // [
    LGLeftBracketToken,
    // ]
    LGRightBracketToken,
    // {
    LGLeftBraceToken,
    // }
    LGRightBraceToken
};

typedef NS_ENUM(NSInteger, LGBlockType) {
    LGNotBlock,
    LGBlockStart,
    LGBlockEnd,
};


static NSString * const codePoints[128] = {
    @"endOfFile:",
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    @"whiteSpace:",
    @"whiteSpace:",
    0,
    @"whiteSpace:",
    @"whiteSpace:",
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    @"whiteSpace:",
    0,
    @"stringStart:",
    @"hash:",
    @"dollarSign:",
    0,
    0,
    @"stringStart:",
    @"leftParenthesis:",
    @"rightParenthesis:",
    @"asterisk:",
    @"plusOrFullStop:",
    @"comma:",
    @"hyphenMinus:",
    @"plusOrFullStop:",
    @"solidus:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"asciiDigit:",
    @"colon:",
    @"semiColon:",
    @"lessThan:",
    0,
    0,
    0,
    @"commercialAt:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"letterU:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"leftBracket:",
    @"reverseSolidus:",
    @"rightBracket:",
    @"circumflexAccent:",
    @"nameStart:",
    0,
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"letterU:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"nameStart:",
    @"leftBrace:",
    @"verticalLine:",
    @"rightBrace:",
    @"tilde:",
    0,
};

@interface LGTokenizer() {
    NSString *_input;
    NSMutableArray *_blockStack;

}

@end

@implementation LGTokenizer


const NSUInteger codePointsNumber = 128;

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        _input = string;
        _blockStack = [NSMutableArray array];
        for (int i = 0; i < _input.length; i++) {
            LGBlockType type = [self nextToken];
            switch (type) {
              case LGBlockStart:
                    NSLog(@"LGBlockStart---%lu", _input.offset);
                    break;
              case LGBlockEnd:
                    NSLog(@"LGBlockEnd---%lu", _input.offset);
                    break;
              default:
                    break;
            }
        }
        
    }
    return self;
}

- (LGBlockType)nextToken
{
    unichar cc = [self consume];
    SEL codePointFunc = 0;
    if (LGIsASCII(cc)) {
        NSAssert(cc < codePointsNumber, @"");
        codePointFunc = NSSelectorFromString(codePoints[cc]);
    }
    if (codePointFunc && [self respondsToSelector:codePointFunc]) {
        LGBlockType msg = ((LGBlockType (*)(id, SEL, unichar))objc_msgSend)((id)self, codePointFunc, cc);
        return msg;
    }
    return LGNotBlock;
}

- (unichar)consume
{
    unichar current = [_input nextInputChar];
    [_input advance];
    return current;
}

- (LGBlockType)leftBrace:(unichar)ss
{
    return [self blockStart:LGLeftBraceToken];
}
- (LGBlockType)rightBrace:(unichar)ss
{
    return [self blockEnd:LGRightBraceToken startType:LGLeftBraceToken];
}

- (LGBlockType)leftParenthesis:(unichar)ss
{
    return [self blockStart:LGLeftParenthesisToken];
}
- (LGBlockType)rightParenthesis:(unichar)ss
{
    return [self blockEnd:LGRightParenthesisToken startType:LGLeftParenthesisToken];
}

- (LGBlockType)leftBracket:(unichar)ss
{
    return [self blockStart:LGLeftBracketToken];
}

- (LGBlockType)rightBracket:(unichar)ss
{
    return [self blockEnd:LGRightBracketToken startType:LGLeftBracketToken];
}


- (LGBlockType)blockStart:(LGParserTokenType)type
{
    [_blockStack addObject:@(type)];
    return LGBlockStart;
}

- (LGBlockType)blockEnd:(LGParserTokenType)type startType:(LGParserTokenType)startType
{
    if (_blockStack.count && [_blockStack.lastObject intValue] == startType) {
        [_blockStack removeLastObject];
        return LGBlockEnd;
    }
    return LGNotBlock;
}

@end
