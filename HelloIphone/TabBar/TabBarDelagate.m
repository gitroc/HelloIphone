//
//  TabBarDelagate.m
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "TabBarDelagate.h"
#import "RocNetManager.h"

@implementation TabBarDelagate
@synthesize window = _window;
@synthesize tabBarViewController = _TabBarViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    //加载视图文件
    [[NSBundle mainBundle]loadNibNamed:@"TabBarViewController" owner:self options:nil];
    [self.window addSubview:self.tabBarViewController.view];
    self.window.backgroundColor = [UIColor yellowColor];
    
    self.window.rootViewController = _TabBarViewController;
    [self.window makeKeyAndVisible];
    
    
    [RocNetManager startMonitoring];
    
    return YES;
}
@end
