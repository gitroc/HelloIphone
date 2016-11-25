//
//  RocNetDefine.h
//  HelloIphone
//
//  Created by roc on 2016/11/24.
//  Copyright © 2016年 saic. All rights reserved.
//

#ifndef RocNetDefine_h
#define RocNetDefine_h

#ifdef DEBUG
#   define DTLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define DTLog(...)
#endif

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

typedef NS_ENUM(NSInteger, RocNetType) {
    RocNetGET = 1,   /**< GET请求 */
    RocNetPOST       /**< POST请求 */
};

/**
 *  网络请求超时的时间
 */
#define MHAsi_API_TIME_OUT 20


#if NS_BLOCKS_AVAILABLE
/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^RocStartBlock)(void);

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^RocSuccessBlock)(id returnData,int code,NSString *msg);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^RocFailureBlock)(NSError *error);

#endif

#endif /* RocNetDefine_h */
