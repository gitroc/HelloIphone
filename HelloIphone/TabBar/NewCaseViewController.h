//
//  NewCaseViewController.h
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCaseViewController : UIViewController

@property (weak, readwrite, nonatomic) NSString *timeNow;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)buttonPressed:(id)sender;
@end
