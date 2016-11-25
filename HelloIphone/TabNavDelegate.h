//
//  TabNavDelegate.h
//  HelloIphone
//
//  Created by roc on 2016/11/21.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstViewController;
@interface TabNavDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

@property (strong,nonatomic) FirstViewController* firstViewController;
@end
