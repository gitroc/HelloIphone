//
//  RocNetManager.h
//  HelloIphone
//
//  Created by roc on 2016/11/24.
//  Copyright © 2016年 saic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RocNetDefine.h"
#import "RocNetDelegate.h"

@interface RocNetManager : NSObject
/// 返回单例
+(instancetype)sharedInstance;

#pragma mark - 发送 GET 请求的方法

/**
 *   GET请求通过Block 回调结果
 *
 *   @param url          url
 *   @param paramsDict   paramsDict
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param showHUD      是否加载进度指示器
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)paramsDict
            successBlock:(RocSuccessBlock)successBlock
            failureBlock:(RocFailureBlock)failureBlock
                 showHUD:(BOOL)showHUD;
/**
 *   GET请求通过代理回调
 *
 *   @param url         url
 *   @param paramsDict  请求的参数
 *   @param delegate    delegate
 *   @param showHUD    是否转圈圈
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)paramsDict
                delegate:(id<RocNetDelegate>)delegate
                 showHUD:(BOOL)showHUD;
/**
 *   get 请求通过 taget 回调方法
 *
 *   @param url         url
 *   @param paramsDict  请求参数的字典
 *   @param target      target
 *   @param action      action
 *   @param showHUD     是否加载进度指示器
 */
+ (void)getRequstWithURL:(NSString*)url
                  params:(NSDictionary*)paramsDict
                  target:(id)target
                  action:(SEL)action
                 showHUD:(BOOL)showHUD;

#pragma mark - 发送 POST 请求的方法
/**
 *   通过 Block回调结果
 *
 *   @param url           url
 *   @param paramsDict    请求的参数字典
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param showHUD       是否加载进度指示器
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)paramsDict
              successBlock:(RocSuccessBlock)successBlock
              failureBlock:(RocFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD;
/**
 *   post请求通过代理回调
 *
 *   @param url         url
 *   @param paramsDict  请求的参数
 *   @param delegate    delegate
 *   @param showHUD    是否转圈圈
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)paramsDict
                  delegate:(id<RocNetDelegate>)delegate
                   showHUD:(BOOL)showHUD;
/**
 *   post 请求通过 target 回调结果
 *
 *   @param url         url
 *   @param paramsDict  请求参数的字典
 *   @param target      target
 *   @param showHUD     是否显示圈圈
 */
+ (void)postReqeustWithURL:(NSString*)url
                    params:(NSDictionary*)paramsDict
                    target:(id)target
                    action:(SEL)action
                   showHUD:(BOOL)showHUD;

@end
