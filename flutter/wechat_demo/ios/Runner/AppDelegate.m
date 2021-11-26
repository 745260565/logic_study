#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    FlutterViewController *vc = (FlutterViewController*)self.window.rootViewController;
    self.mothodChannel = [FlutterMethodChannel methodChannelWithName:@"/mine_page/method" binaryMessenger:vc];
    UIImagePickerController *imageVC = [[UIImagePickerController alloc] init];
    [self.mothodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"picture"]) {
            [vc presentViewController:imageVC animated:YES completion:nil];
        }
    }];
    imageVC.delegate = self;
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
        NSString *imagePaht = [NSString stringWithFormat:@"%@",info[@"UIImagePickerControllerImageURL"]];
        [self.mothodChannel invokeMethod:@"imagePath" arguments:imagePaht];
    }];
}


@end
