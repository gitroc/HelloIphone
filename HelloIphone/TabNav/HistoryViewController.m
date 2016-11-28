//
//  HistoryViewController.m
//  HelloIphone
//
//  Created by roc on 2016/11/17.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "HistoryViewController.h"
//#import "AFNetworking.h"//主要用于网络请求方法
#import "UIKit+AFNetworking.h"//里面有异步加载图片的方法
#import "RocNetManager.h"
#import "RocNetItem.h"

@interface HistoryViewController () <RocNetDelegate>

@property (nonatomic, strong) NSArray         *standImages;
@property (nonatomic, strong) NSArray         *xiaozhaoImages;
@property (nonatomic, strong) NSArray         *dazhaoImages;


@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadImages];
    
//    self.navigationBar.backgroundColor = [UIColor redColor];
    self.title = @"测试导航";
    
    [self.imageView setImageWithURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=5429fa5d6259252db71a155655f2685e/d0c8a786c9177f3eead9e44a72cf3bc79e3d5683.jpg"] placeholderImage:[UIImage imageNamed:@"logo"]];
    [self.imageView setBackgroundColor:[UIColor yellowColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadImages {
    // 加载站立图片
    self.standImages = [self loadImagesWithImagePrefixName:@"stand" count:10];
    
    // 加载小招图片
    self.xiaozhaoImages =  [self loadImagesWithImagePrefixName:@"xiaozhao2" count:35];
    
    // 加载大招图片
    self.dazhaoImages =  [self loadImagesWithImagePrefixName:@"dazhao" count:87];
}

- (void) actionStand {
    [self movesWithImages:self.standImages repeatCount:0 duration:1.0 isStand:YES];
}

- (void) actionXiaozhao {
    [self movesWithImages:self.xiaozhaoImages repeatCount:0 duration:2.0 isStand:NO];
}

- (void) actionDazhao {
    [self movesWithImages:self.dazhaoImages repeatCount:0 duration:4.0 isStand:NO];
}

- (void) gameOver {
    self.standImages = nil;
    self.xiaozhaoImages = nil;
    self.dazhaoImages = nil;
    
    self.imageView.animationImages = nil;
}

// 抽取加载图片重复的代码
- (NSArray *)loadImagesWithImagePrefixName:(NSString *)prefixName count:(int)count  {
    NSMutableArray<UIImage *> *images = [NSMutableArray array];  // 创建一个可变数组，用于装载图片
    for (int i = 0; i < count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%d", prefixName, i + 1];  // 获取图片的名称
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];  // 获取图片在资源包中的路径
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];  // 加载图片
        [images addObject:image];  // 将图片添加到可变数组中
    }
    return images;  // 返回数组
}

// 抽取发招的方法
- (void)movesWithImages:(NSArray *)images repeatCount:(int)repeatCount duration:(float)duration isStand:(BOOL)isStand {
    self.imageView.animationImages = images;  // 设置动画
    self.imageView.animationRepeatCount = repeatCount;  // 设置动画播放的次数
    self.imageView.animationDuration = duration;  // 设置动画播放的时长
    
    [self.imageView startAnimating];  // 开始播放动画
    
    if (!isStand) {
        [self performSelector:@selector(actionStand) withObject:nil afterDelay:self.imageView.animationDuration];  // 延时加载
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onClickGet:(id)sender {
   
}

- (IBAction)onClickPost:(id)sender {
     [self delegate];
}

- (IBAction)onClickIpLoad:(id)sender {
    
}


- (void) block {
    [RocNetManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} successBlock:^(id returnData,int code,NSString *msg) {
        
        NSLog(@"hello i am bolck----%@",returnData);
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"hello i am bolck-----%@",error.localizedDescription);
        
    } showHUD:YES];
}

- (void) delegate {
    NSLog(@"hello,  i am delegate");
    [RocNetManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} delegate:self showHUD:YES];
}

/**
 *   请求结束
 *
 *   @param returnData 返回的数据
 */
- (void)requestDidFinishLoading:(NSDictionary*)returnData {
    NSLog(@"hello i am delegate-----%@",returnData);
}
/**
 *   请求失败
 *
 *   @param error 失败的 error
 */
- (void)requestdidFailWithError:(NSError*)error{
    NSLog(@"hello i am delegate-----%@",error);
}

- (void) sel {
    NSLog(@"hello, i am sel");
    [RocNetManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} target:self action:@selector(finishedRequest:didFaild:) showHUD:YES];
}

#pragma mark - target
- (void)finishedRequest:(id)data didFaild:(NSError*)error
{
    NSLog(@"hello, i am sel---%@-%@",data,error);
}

- (IBAction)stand:(id)sender {
    [self actionStand];
}

- (IBAction)xiaozhao:(id)sender {
    [self actionXiaozhao];
}

- (IBAction)dazhao:(id)sender {
    [self actionDazhao];
}
@end
