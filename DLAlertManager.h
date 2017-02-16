//
//  DLAlertManager.h
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLAlertTask.h"

@interface DLAlertManager : NSObject

+ (instancetype)sharedInstance;
- (void)enqueueTask:(DLAlertTask *)task;

@end
