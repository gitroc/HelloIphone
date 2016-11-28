//
//  FirstViewController.h
//  HelloIphone
//
//  Created by roc on 2016/11/21.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>  
@property (strong, nonatomic) IBOutlet UITableView *tableRecords;
@end
