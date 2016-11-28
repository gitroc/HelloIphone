//
//  RocNetHandler.h
//  HelloIphone
//
//  Created by roc on 2016/11/24.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RocNetDelegate.h"
#import "RocNetBlock.h"


#import "RocNetDefine.h"
@class RocNetItem;
@interface RocNetHandler : NSObject <RocNetDelegate>
/**
 *  单例
 *
 *  @return BMNetworkHandler的单例对象
 */
+ (RocNetHandler *)sharedInstance;

/**
 *  items
 */
@property(nonatomic,strong)NSMutableArray *items;

/**
 *   单个网络请求项
 */
@property(nonatomic,strong)RocNetItem *netItem;

/**
 *  networkError
 */
@property(nonatomic,assign)BOOL networkError;

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
- (RocNetItem*)conURL:(NSString *)url
                netType:(RocNetType)netType
                     params:(NSMutableDictionary *)params
                   delegate:(id)delegate
                    showHUD:(BOOL)showHUD
                     target:(id)target
                     action:(SEL)action
               successBlock:(RocSuccessBlock)successBlock
               failureBlock:(RocFailureBlock)failureBlock;
/**
 *   取消所有正在执行的网络请求项
 */
+ (void)cancelAllNetItems;

@end
