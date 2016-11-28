//
//  HelloIphoneViewController.h
//  HelloIphone
//
//  Created by roc on 2016/11/16.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloIphoneViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;
@property (strong, nonatomic) IBOutlet UITextField *userNameText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UISwitch *swtichButton;
@property (strong, nonatomic) IBOutlet UIButton *button;

- (IBAction)textUseNameDone:(id)sender;
- (IBAction)textPasswordDone:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)segementButton:(id)sender;
- (IBAction)switchchanged:(id)sender;
- (IBAction)buttonOnclick:(id)sender;

@end
