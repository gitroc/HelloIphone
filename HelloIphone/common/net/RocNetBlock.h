//
//  RocNetBlock.h
//  HelloIphone
//
//  Created by roc on 2016/11/28.
//  Copyright © 2016年 saic. All rights reserved.
//

#ifndef RocNetBlock_h
#define RocNetBlock_h

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

#endif /* RocNetBlock_h */
