//
//  HistoryViewController.h
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RocNetDelegate.h"

@interface HistoryViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;
- (IBAction)onClickGet:(id)sender;
- (IBAction)onClickPost:(id)sender;
- (IBAction)onClickIpLoad:(id)sender;
- (IBAction)stand:(id)sender;
- (IBAction)xiaozhao:(id)sender;
- (IBAction)dazhao:(id)sender;

@end
