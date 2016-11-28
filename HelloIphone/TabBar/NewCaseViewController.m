//
//  NewCaseViewController.m
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "NewCaseViewController.h"

@interface NewCaseViewController ()

@end

@implementation NewCaseViewController
@synthesize timeNow = _timerNow;
@synthesize datePicker;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonPressed:(id)sender {
    NSDate * selected = [self.datePicker date];//获取选取时间
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm +0800"];

    NSString *destDateString = [dateFormatter stringFromDate:selected];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"时间提示" message:destDateString preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];

    [self presentViewController:alertController animated:YES completion:nil];
}

- (NSString*)interceptTimeStampFromStr:(NSString*)str
{
    if (!str || [str length] == 0) { // 字符串为空判断
        return @"";
    }
    // 把时间戳转化成时间
    NSTimeInterval interval = [str doubleValue] / 1000.0;
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter* objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
    [objDateformat setTimeZone:[NSTimeZone localTimeZone]];
    NSString* timeStr = [NSString stringWithFormat:@"%@", [objDateformat stringFromDate:date]];
    return timeStr;
}

- (void)testTime
{
    NSDate* now = [NSDate date]; //根据当前系统的时区产生当前的时间，绝对时间，所以同为中午12点，不同的时区，这个时间是不同的。
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone systemTimeZone]; //系统所在时区
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString* systemTimeZoneStr = [df stringFromDate:now];
    df.timeZone = [NSTimeZone defaultTimeZone]; //默认时区，貌似和上一个没什么区别
    NSString* defaultTimeZoneStr = [df stringFromDate:now];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:8 * 3600]; //直接指定时区
    NSString* plus8TZStr = [df stringFromDate:now];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0]; //这就是GMT+0时区了
    NSString* gmtTZStr = [df stringFromDate:now];
    NSLog(@"Test Time\nSys:%@\nDefault:%@\n+8:%@\nGMT:%@", systemTimeZoneStr, defaultTimeZoneStr, plus8TZStr, gmtTZStr);
}
@end
