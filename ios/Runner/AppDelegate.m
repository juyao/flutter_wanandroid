#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

#import <Flutter/Flutter.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"top.dodeman/wanandroid"
                                            binaryMessenger:controller];
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {

        if([call.method isEqualToString:@"copyToClipBoard"]){
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = call.arguments[@"message"];
            [self showAlert];
        }
    }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (IBAction)showAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"友情提醒"
                                                    message:@"复制链接成功"
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil,nil];
    [alert addButtonWithTitle:@"确定"];
    [alert show];
    
}

-(void)showAlertMsg:(NSString *)message Duration:(float)duration
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    
    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(self.window.bounds.size.width-50, 9000)];
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    label.numberOfLines = 0; //
    
    [showview addSubview:label];
    showview.frame = CGRectMake((self.window.bounds.size.width - LabelSize.width)/2, self.window.bounds.size.height/2 +50+LabelSize.height, LabelSize.width+10, LabelSize.height+10);
    [UIView animateWithDuration:duration animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

@end
