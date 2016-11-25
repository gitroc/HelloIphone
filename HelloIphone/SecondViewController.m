//
//  SecondViewController.m
//  HelloIphone
//
//  Created by roc on 2016/11/21.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "SecondViewController.h"
#import "PopUpViewController.h"  

@interface SecondViewController ()
@property (weak, nonatomic) NSMutableArray* secondCellContent;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableFunction.dataSource = self;
    self.tableFunction.delegate = self;
    
    _secondCellContent = [NSMutableArray arrayWithObjects:@"对应表",@"通用功能",@"关于",nil];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [_secondCellContent objectAtIndex:row];
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds = YES;
    //cell.detailTextLabel.text = @"detail";
    
    //return  nil;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _secondCellContent.count;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PopUpViewController* pvc = [[PopUpViewController alloc] init];
    //svc.view.backgroundColor = [UIColor redColor];
    pvc.title = @"页面详细";
    self.hidesBottomBarWhenPushed  = YES;
    [self.navigationController pushViewController:pvc animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed    = NO;
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
