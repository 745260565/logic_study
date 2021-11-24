#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    FlutterViewController *vc = self.window.rootViewController;
    FlutterMethodChannel *mothodChannel = [FlutterMethodChannel methodChannelWithName:@"/mine_page/method" binaryMessenger:vc];
    [mothodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"picture"]) {
            UIImagePickerController *iVC = [[UIImagePickerController alloc] init];
            [vc presentViewController:iVC animated:YES completion:nil];
        }
    }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
