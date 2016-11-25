//
//  FirstViewController.m
//  HelloIphone
//
//  Created by roc on 2016/11/21.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "FirstViewController.h"
#import "DisplaySettingViewController.h"
#import "PopUpViewController.h"
#import "MJRefresh.h"

@interface FirstViewController ()
//@property (weak, nonatomic) NSMutableArray* firstCellContent;
@end


@implementation FirstViewController
NSMutableArray* firstCellContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    firstCellContent                       = [NSMutableArray arrayWithObjects:@" +点击添加新纪录",@"记录1",@"记录2",nil];

    
    UIBarButtonItem* btn                   = [[UIBarButtonItem alloc]initWithTitle:@"排版" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    self.navigationItem.rightBarButtonItem = btn;
    
    self.tableRecords.dataSource           = self;
    self.tableRecords.delegate             = self;
    
    self.tableRecords.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"headerWithRefreshingBlock");
        [self.tableRecords.mj_header endRefreshing];
    }];
    
    self.tableRecords.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:(@selector(loadData))];
    
    [self.tableRecords.mj_header beginRefreshing];
    
    self.tableRecords.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"footerWithRefreshingBlock");
    }];
    
    self.tableRecords.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:(@selector(loadMoreData))];
    
}

- (void) loadData {
    NSLog(@"start loadData");
    [self.tableRecords.mj_header endRefreshing];
}

- (void) loadMoreData {
    NSLog(@"start loadMoreData");
    [self.tableRecords.mj_header endRefreshing];
}

-(void)btnClick
{
    DisplaySettingViewController* dsvc     = [[DisplaySettingViewController alloc]initWithNibName:@"DisplaySettingViewController"bundle:nil];
    dsvc.view.backgroundColor              = [UIColor redColor];
    dsvc.title                             = @"显示排版";
    self.hidesBottomBarWhenPushed          = NO;
    [self.navigationController pushViewController:dsvc animated:YES];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell                  =[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if(cell == nil)
    {
        cell                               = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    
    NSUInteger row                         = indexPath.row;
    cell.textLabel.text                    = [firstCellContent objectAtIndex:row];
    cell.layer.cornerRadius                = 12;
    cell.layer.masksToBounds               = YES;
    return  cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return firstCellContent.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PopUpViewController* pvc               = [[PopUpViewController alloc]init];
    //svc.view.backgroundColor             = [UIColor redColor];
    pvc.title                              = @"页面详细";
    self.hidesBottomBarWhenPushed          =NO;
    [self.navigationController pushViewController:pvc animated:YES];
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
