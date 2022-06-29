#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) dispatch_queue_t  queue;
@property (nonatomic, strong) NSString *nameStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *firstString = @"helloworld";
    NSString *secondString = [NSString stringWithFormat:@"helloworld"];
    NSString *thirdString = @"hello";
    NSString *fourthSting = [NSString stringWithFormat:@"hello"];

    NSLog(@"%p %@",firstString,[firstString class]);
    NSLog(@"%p %@",secondString,[secondString class]);
    NSLog(@"%p %@",thirdString,[thirdString class]);
    NSLog(@"%p %@",fourthSting,[fourthSting class]);
        
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.queue = dispatch_queue_create("com.lg.cn", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i<10000; i++) {
        dispatch_async(self.queue, ^{
            self.nameStr = [NSString stringWithFormat:@"LG"];
            NSLog(@"%@",self.nameStr);
        });
    }
    
    for (int i = 0; i<10000; i++) {
        dispatch_async(self.queue, ^{
            self.nameStr = [NSString stringWithFormat:@"逻辑教育"];
            NSLog(@"%@",self.nameStr);
        });
    }
}

@end

