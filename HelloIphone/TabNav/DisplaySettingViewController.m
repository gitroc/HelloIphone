//
//  DisplaySettingViewController.m
//  HelloIphone
//
//  Created by roc on 2016/11/21.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "DisplaySettingViewController.h"

@interface DisplaySettingViewController ()
@property (weak, nonatomic) NSMutableArray* displayCellContent;
@end

@implementation DisplaySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableDisplayStyle.delegate =self;
    self.tableDisplayStyle.dataSource =self;
    
    
    _displayCellContent = [NSMutableArray arrayWithObjects:@"展开所有记录",@"仅展开一个星期的记录",@"仅展开两个星期的记录",@"仅展开一个月的记录",nil];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [_displayCellContent objectAtIndex:row];
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds =YES;
    
    return  cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _displayCellContent.count;
}



-(void)viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed    =NO;
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

@end
