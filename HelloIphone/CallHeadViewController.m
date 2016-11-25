//
//  CallHeadViewController.m
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "CallHeadViewController.h"

#define singerPickerView 0
#define singPickerView 1

@interface CallHeadViewController ()

@end

@implementation CallHeadViewController

@synthesize singerData = _singerData;
@synthesize singData = _singData;
@synthesize pickerDictionary = _pickerDictionary;
@synthesize pickerView = _pickerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //    获取mainBundle
    NSBundle *bundle = [NSBundle mainBundle];
    //    获取songInfo.plist文件路径
    NSURL *songInfo = [bundle URLForResource:@"songInfo" withExtension:@"plist"];
    //    把plist文件里内容存入数组
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfURL:songInfo];
    _pickerDictionary=dic;
    //    将字典里面的内容取出放到数组中
    NSArray *components = [dic allKeys];
    
    //选取出第一个滚轮中的值
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    
    _singerData = sorted;
    
    //    根据第一个滚轮中的值，选取第二个滚轮中的值
    NSString *selectedState = [_singerData objectAtIndex:0];
    NSArray *array = [dic objectForKey:selectedState];
    _singData=array;
    
    self.pickerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _pickerView.showsSelectionIndicator=YES;
    [self.view addSubview:_pickerView];
    [_pickerView selectRow:0  inComponent:0  animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    _pickerView = nil;
    _singerData = nil;
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
    NSInteger singerrow = [_pickerView selectedRowInComponent:(0)];
    NSInteger singrow = [_pickerView selectedRowInComponent:1];
    
    NSString *singerselected = [_singerData objectAtIndex:singerrow];
    NSString *singselected = [_singData objectAtIndex:singrow];
    
    NSString *message = [[NSString alloc] initWithFormat:@"%@ 的 %@ ",singerselected,singselected];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"你选择的是" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return (2);
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger count;
    switch (component) {
        case 0:
            count = [_singerData count];
            break;
        case 1:
            count = [_singData count];
        default:
            break;
    }
    return count;
}

#pragma mark Picker Delegate Methods
//书上介绍说这里面得委托方法是可选得（delegate中用optional修饰），实际上我们至少要实现一个委托方法
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSString *rowString;
    switch (component) {
        case 0:
            rowString = [_singerData objectAtIndex:row];
            break;
        case 1:
           rowString = [_singData objectAtIndex:row];
        default:
            break;
    }
    
    return rowString;
}

-(void)pickerView:(UIPickerView *)pickerViewt didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //    如果选取的是第一个选取器
    if (component == 0) {
        //        得到第一个选取器的当前行
        NSString *selectedState =[_singerData objectAtIndex:row];
        
        //        根据从pickerDictionary字典中取出的值，选择对应第二个中的值
        NSArray *array = [_pickerDictionary objectForKey:selectedState];
        _singData=array;
        [_pickerView selectRow:0 inComponent:1 animated:YES];
        
        
        //        重新装载第二个滚轮中的值
        [_pickerView reloadComponent:1];
    }  
}

//设置滚轮的宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        return 120;
    }
    return 200;
}

@end
