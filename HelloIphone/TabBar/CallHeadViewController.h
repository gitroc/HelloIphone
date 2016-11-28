//
//  CallHeadViewController.h
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallHeadViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) NSArray *singerData;
@property (strong, nonatomic) NSArray *singData;
@property (strong, nonatomic) NSDictionary *pickerDictionary;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)buttonPressed:(id)sender;

@end
