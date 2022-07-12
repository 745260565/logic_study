//
//  ViewController.m
//  LGImageDecodeDemo
//
//  Created by cooci on 2022/6/7.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *kcImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSData *data = [NSData dataWithContentsOfFile:@"/Users/mac/Desktop/收藏资料/讲师照片/cooci.png"];
//        UIImage *image = [UIImage imageWithData:data];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.kcImageView.image = image;
//        });
//    });

    [self preCode];
}

- (void)preCode{
//        UIImage *image = [UIImage imageWithContentsOfFile:@"/Users/mac/Desktop/收藏资料/讲师照片/cooci.png"];
//        self.kcImageView.image = image;
//        self.kcImageView.image = [self downsampleImageAt:[NSURL fileURLWithPath:@"/Users/mac/Desktop/收藏资料/讲师照片/cooci.png"] to:self.kcImageView.frame.size scale:1];
        self.kcImageView.image = [UIImage imageNamed:@"cooci"];
}


// Objective-C： 大图缩小为显示尺寸的图
- (UIImage *)downsampleImageAt:(NSURL *)imageURL to:(CGSize)pointSize scale:(CGFloat)scale {
    // 利用图像文件地址创建 image source
    NSDictionary *imageSourceOptions = @{(__bridge NSString *)kCGImageSourceShouldCache: @NO // 原始图像不要解码
    };
    CGImageSourceRef imageSource =
    CGImageSourceCreateWithURL((__bridge CFURLRef)imageURL, (__bridge CFDictionaryRef)imageSourceOptions);

    // 下采样
    CGFloat maxDimensionInPixels = MAX(pointSize.width, pointSize.height) * scale;
    NSDictionary *downsampleOptions =
    @{
      (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways: @YES,
      (__bridge NSString *)kCGImageSourceShouldCacheImmediately: @YES,  // 缩小图像的同时进行解码
      (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform: @YES,
      (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize: @(maxDimensionInPixels)
       };
    CGImageRef downsampledImage =
    CGImageSourceCreateThumbnailAtIndex(imageSource, 0, (__bridge CFDictionaryRef)downsampleOptions);
    UIImage *image = [[UIImage alloc] initWithCGImage:downsampledImage];
    CGImageRelease(downsampledImage);
    CFRelease(imageSource);

    return image;
}


//Swift Downsampling large images for display at smaller size
//func downsample(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat) -> UIImage {
//    let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
//    let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions)!
//    let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
//    let downsampleOptions =
//    [kCGImageSourceCreateThumbnailFromImageAlways: true,
//    kCGImageSourceShouldCacheImmediately: true,
//    kCGImageSourceCreateThumbnailWithTransform: true,
//    kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels] as CFDictionary
//
//    let downsampledImage =
//    CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions)!
//    return UIImage(cgImage: downsampledImage)
//}


@end
