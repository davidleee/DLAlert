//
//  DLAlertController.m
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "DLAlertController.h"
#import "DLAlertManager.h"

@implementation DLAlertController

+ (void)presentWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray<DLAlertAction *> *)action {
    DLAlertTask *task = [[DLAlertTask alloc] initWithTitle:title message:message actions:action];
    [[DLAlertManager sharedInstance] enqueueTask:task];
}

@end
