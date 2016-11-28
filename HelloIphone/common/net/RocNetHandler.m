//
//  RocNetHandler.m
//  HelloIphone
//
//  Created by roc on 2016/11/24.
//  Copyright © 2016年 saic. All rights reserved.
//

#import "RocNetHandler.h"
#import "RocNetItem.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
//#import "RocNetDefine.h"

@implementation RocNetHandler
+ (RocNetHandler *)sharedInstance
{
    static RocNetHandler *handler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[RocNetHandler alloc] init];
    });
    
    return handler;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.networkError = NO;
    }
    return self;
}

#pragma mark - 创建一个网络请求项
/**
 *  创建一个网络请求项
 *
 *  @param url          网络请求URL
 *  @param netType      网络请求方式
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return 根据网络请求的委托delegate而生成的唯一标示
 */
- (RocNetItem *)conURL:(NSString *)url
                    netType:(RocNetType)netType
                     params:(NSMutableDictionary *)params
                   delegate:(id)delegate
                    showHUD:(BOOL)showHUD
                     target:(id)target
                     action:(SEL)action
               successBlock:(RocSuccessBlock)successBlock
               failureBlock:(RocFailureBlock)failureBlock
{
    if (self.networkError == YES) {
        DTLog(@"网络连接断开,请检查网络!");
        return nil;
    }
    /// 如果有一些公共处理，可以写在这里
    NSUInteger hashValue = [delegate hash];
    self.netItem = [[RocNetItem alloc]initWithtype:netType url:url params:params delegate:delegate target:target action:action hashValue:hashValue showHUD:showHUD successBlock:successBlock failureBlock:failureBlock];
    self.netItem.delegate = delegate;
    [self.items addObject:self.netItem];
    return self.netItem;
}

/**
 *   懒加载网络请求项的 items 数组
 *
 *   @return 返回一个数组
 */
- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}
/**
 *   取消所有正在执行的网络请求项
 */
+ (void)cancelAllNetItems
{
    RocNetHandler *handler = [RocNetHandler sharedInstance];
    [handler.items removeAllObjects];
    handler.netItem = nil;
}

- (void)netWorkWillDealloc:(RocNetItem *)itme
{
    
    [self.items removeObject:itme];
    self.netItem = nil;
    
    NSLog(@"-----%@",self.items);
    
}

@end
