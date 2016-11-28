//
//  AppDelegate.h
//  HelloIphone
//
//  Created by roc on 2016/11/16.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class HelloIphoneViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HelloIphoneViewController *helloIphoneViewController;

@property (readonly, strong) NSPersistentContainer *persistentContainer;


- (void)saveContext;


@end

