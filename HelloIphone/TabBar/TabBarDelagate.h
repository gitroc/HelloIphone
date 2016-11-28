//
//  TabBarDelagate.h
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarDelagate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *tabBarViewController;

@end
