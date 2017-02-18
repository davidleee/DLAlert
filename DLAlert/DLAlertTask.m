//
//  DLAlertTask.m
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "DLAlertTask.h"
#import "DLAlertAction.h"

@interface DLAlertTask()
@property (strong, nonatomic) NSString *taskTitle;
@property (strong, nonatomic) NSString *taskMessage;
@property (strong, nonatomic) NSArray <DLAlertAction *> *actions;
@end

@implementation DLAlertTask

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <DLAlertAction *> *)actions {
    self = [super init];
    if (self) {
        self.taskTitle = title;
        self.taskMessage = message;
        self.actions = [actions copy];
    }
    return self;
}

@end
