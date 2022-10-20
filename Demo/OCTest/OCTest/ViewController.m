//
//  ViewController.m
//  OCTest
//
//  Created by ChengHao on 2022/1/13.
//

#import "ViewController.h"
#import <objc/runtime.h>

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
    
    NSLog(@"0x%lx",lg_objc_decodeTaggedPointer(fourthString));
    
    
    // Do any additional setup after loading the view.
}

#define lg_OBJC_TAG_INDEX_MASK 0x7UL
#define lg_OBJC_TAG_INDEX_SHIFT 0

extern uintptr_t objc_debug_taggedpointer_obfuscator;
extern uint8_t objc_debug_tag60_permutations[8];

uintptr_t lg_objc_obfuscatedTagToBasicTag(uintptr_t tag) {
    for (unsigned i = 0; i < 7; i++)
        if (objc_debug_tag60_permutations[i] == tag)
            return i;
    return 7;
}

uintptr_t
lg_objc_decodeTaggedPointer(id ptr)
{
    uintptr_t value = (uintptr_t)ptr ^ objc_debug_taggedpointer_obfuscator;
    uintptr_t basicTag = (value >> lg_OBJC_TAG_INDEX_SHIFT) & lg_OBJC_TAG_INDEX_MASK;

    value &= ~(lg_OBJC_TAG_INDEX_MASK << lg_OBJC_TAG_INDEX_SHIFT);
    value |= lg_objc_obfuscatedTagToBasicTag(basicTag) << lg_OBJC_TAG_INDEX_SHIFT;
    return value;
}

static inline uintptr_t lg_objc_basicTagToObfuscatedTag(uintptr_t tag) {
    return objc_debug_tag60_permutations[tag];
}

void *
lg_objc_encodeTaggedPointer(uintptr_t ptr)
{
    uintptr_t value = (objc_debug_taggedpointer_obfuscator ^ ptr);

    uintptr_t basicTag = (value >> lg_OBJC_TAG_INDEX_SHIFT) & lg_OBJC_TAG_INDEX_MASK;
    uintptr_t permutedTag = lg_objc_basicTagToObfuscatedTag(basicTag);
    value &= ~(lg_OBJC_TAG_INDEX_MASK << lg_OBJC_TAG_INDEX_SHIFT);
    value |= permutedTag << lg_OBJC_TAG_INDEX_SHIFT;
    return (void *)value;
}


@end
