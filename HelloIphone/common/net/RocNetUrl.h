//
//  RocNetUrl.h
//  HelloIphone
//
//  Created by roc on 2016/11/24.
//  Copyright © 2016年 saic. All rights reserved.
//

#ifndef RocNetUrl_h
#define RocNetUrl_h

/**
 *  API HOST
 */
#define API_HOST @"http://www.perasst.com:8082/perasst_v3"
// 接口路径全拼
#define PATH(_path) [NSString stringWithFormat:_path, API_HOST]

/**
 *      用户登录
 */
#define DEF_USER_Login  PATH(@"%@/user/login.pa")

/**
 *      发送验证码
 */
#define DEF_SendCode   PATH(@"%@/user/sendRegisterVerifyCode.pa")
/**
 *      用户注册
 */
#define DEF_USER_REGIST PATH(@"%@/user/sendRegisterVerifyCode.pa")

#endif /* RocNetUrl_h */
