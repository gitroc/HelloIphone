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

//#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
//[alert show];

typedef NS_ENUM(NSInteger, RocNetType) {
    RocNetGET = 1,   /**< GET请求 */
    RocNetPOST       /**< POST请求 */
};

/**
 *  网络请求超时的时间
 */
#define MHAsi_API_TIME_OUT 20

#endif /* RocNetDefine_h */
