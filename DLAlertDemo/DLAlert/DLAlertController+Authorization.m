//
//  DLAlertController+Authorization.m
//  Leo
//
//  Created by David Lee on 2017/1/25.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "DLAlertController+Authorization.h"
#import <AVFoundation/AVFoundation.h>

@implementation DLAlertController (Authorization)

+ (void)checkCameraAuthorizationSuccess:(dispatch_block_t)success fail:(dispatch_block_t)fail {
    AVAuthorizationStatus cameraAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (cameraAuthStatus != AVAuthorizationStatusAuthorized) {
        DLAlertAction *cancel = [DLAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:^(DLAlertAction *action) {
            if (fail) {
                fail();
            }
        }];
        DLAlertAction *goSetting = [DLAlertAction actionWithTitle:NSLocalizedString(@"去设置", nil) style:UIAlertActionStyleDefault handler:^(DLAlertAction *action) {
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 10) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            } else {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
            }
        }];
        NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        if (!appName) {
            appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
        }
        NSString *alertMsg = NSLocalizedString(@"您关闭了 ", nil);
        alertMsg = [alertMsg stringByAppendingString:appName];
        [DLAlertController presentWithTitle:NSLocalizedString(@"权限缺失", nil) message:[alertMsg stringByAppendingString:NSLocalizedString(@" 的相机权限，功能将有缺失", nil)] actions:@[cancel, goSetting]];
    } else {
        if (success) {
            success();
        }
    }
}

@end
