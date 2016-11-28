//
//  PopUpViewController.h
//  HelloIphone
//
//  Created by roc on 2016/11/21.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopUpViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)IBOutlet UITableView *tableDisplayStyle;
@end
