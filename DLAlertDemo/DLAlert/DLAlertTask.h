//
//  DLAlertTask.h
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DLAlertAction;
@interface DLAlertTask : NSObject
@property (assign, nonatomic) BOOL executing;

@property (strong, nonatomic, readonly) NSString *taskTitle;
@property (strong, nonatomic, readonly) NSString *taskMessage;
@property (strong, nonatomic, readonly) NSArray <DLAlertAction *> *actions;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <DLAlertAction *> *)actions;
@end
