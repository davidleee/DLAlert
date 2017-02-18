//
//  DLAlertController+Authorization.h
//  Leo
//
//  Created by David Lee on 2017/1/25.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "DLAlertController.h"

@interface DLAlertController (Authorization)

/**
 检查相机权限，没有权限时给出提示

 @param success 有权限时执行回调
 @param fail    用户不授权时执行回调
 */
+ (void)checkCameraAuthorizationSuccess:(dispatch_block_t)success fail:(dispatch_block_t)fail;

@end
