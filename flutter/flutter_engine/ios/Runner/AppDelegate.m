#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate()
@property(nonatomic, strong) FlutterEngine *flutterEngine;
@property(nonatomic, strong) FlutterViewController *flutterVc;
@property(nonatomic, strong) FlutterMethodChannel *methodChannel;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
//    self.flutterVc = [[FlutterViewController alloc] initWithEngine:self.flutterEngine nibName:nil bundle:nil];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
